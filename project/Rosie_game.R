# DIY : Pao Ying Chub

```r
Rosie_game <- function() {
  cat("Welcome to 'Rosie' world \n")
  cat("===================================\n")
  
  options <- c("hammer", "scissor", "paper")
  
  cat("This is options\n")
  print(options)
  cat("Choose one! or type 'Exit' to exit this game\n")
  
  user_score <- 0
  bot_score <- 0
  
  while(TRUE) {
    start_game <- readline("Welcome to Rosie game, 'Start' or 'Exit' : ")
    print(paste("I will choose : ", start_game))
    if (start_game == "Exit") {
      print("Thanks, such great time")
      break
    }  else if (start_game == "Start") {
      
      user_name <- readline("PLease type your name : ")
      cat(paste("Hello!",toupper(user_name),"\n"))
      cat("---------------------------------\n")
      cat("Let's start!!\n")
    }
    
    bot_select <- sample(options, 1)
    print(options)
    user_select <- readline("Choose one : ")
    print(paste("I will choose : ", user_select))
    print(paste("Bot choose : ", bot_select))
 
    if (user_select == bot_select ) {
      print("Draw")
      user_score = user_score + 0
      bot_score = bot_score + 0
      
    } else if (user_select == "hammer" & bot_select == "scissor") {
      print("You win!!")
      user_score = user_score + 1
      bot_score = bot_score + 0
      
    } else if (user_select == "scissor" & bot_select == "paper") {
      print("You win!!")
      user_score = user_score + 1
      bot_score = bot_score + 0
      
    } else if (user_select == "paper" & bot_select == "hammer") {
      print("You win!!")
      user_score = user_score + 1
      bot_score = bot_score + 0
      
    } else if (bot_select == "hammer" & user_select == "scissor") {
      print("You lose! sorry")
      bot_score = bot_score + 1
      user_score = user_score + 0
      
    } else if (bot_select == "scissor" & user_select == "paper") {
      print("You lose! sorry")
      bot_score = bot_score + 1
      user_score = user_score + 0
      
    } else if (bot_select == "paper" & user_select == "hammer") {
      print("You lose! sorry")
      bot_score = bot_score + 1
      user_score = user_score + 0
    
    } 
  }
  
  cat("--------------------------------------------------\n")
  cat(">> The ended <<\n")
  print(paste("Your Score :", user_score))
  print(paste("Bot's Score :", bot_score))
  
  if (user_score > bot_score) {
    print("Congratulations! You are the Winner")
  } else if (user_score < bot_score) {
    print("Sorry, practice more")
  } else if (user_score == bot_score) {
    print(" To end in a draw")
  }
  
  cat("Thanks for joining Rosie game\n")
  cat("================================\n")
  cat("========= See you again ========\n")
  
}
