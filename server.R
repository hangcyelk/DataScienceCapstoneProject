

suppressWarnings(library(tm))
suppressWarnings(library(stringr))
suppressWarnings(library(shiny))

#Load ngram models
quadgram <- readRDS("quadgram.rdata")
trigram <- readRDS("trigram.rdata")
bigram <- readRDS("bigram.rdata")
mesg <<- ""

## Create Ngram Matching Functions

word_predict <- function(x) {
  input_clean <- removeNumbers(removePunctuation(tolower(x)))
  user_input <- strsplit(input_clean, " ")[[1]]
  
  if (length(user_input)>= 3) {
    user_input <- tail(user_input,3)
    if (identical(character(0),head(quadgram[quadgram$unigram == user_input[1] & quadgram$bigram == user_input[2] & quadgram$trigram == user_input[3], 4],1))){
      word_predict(paste(user_input[2],user_input[3],sep=" "))
    }
    else {mesg <<- "quad-grams has been used"; head(quadgram[quadgram$unigram == user_input[1] & quadgram$bigram == user_input[2] & quadgram$trigram == user_input[3], 4],1)}
  }
  else if (length(user_input) == 2){
    user_input <- tail(user_input,2)
    if (identical(character(0),head(trigram[trigram$unigram == user_input[1] & trigram$bigram == user_input[2], 3],1))) {
      word_predict(user_input[2])
    }
    else {mesg<<- "tri-grams has been used"; head(trigram[trigram$unigram == user_input[1] & trigram$bigram == user_input[2], 3],1)}
  }
  else if (length(user_input) == 1){
    user_input <- tail(user_input,1)
    if (identical(character(0),head(bigram[bigram$unigram == user_input[1], 2],1))) {mesg<<-"You might wanna check and type it again"}
    else {mesg <<- "bi-grams has been used."; head(bigram[bigram$unigram == user_input[1],2],1)}
  }
}

shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- word_predict(input$inputString)
    output$method <- renderText({mesg})
    result
  });
  
  output$answer <- renderText({
    input$inputString});
}
)







