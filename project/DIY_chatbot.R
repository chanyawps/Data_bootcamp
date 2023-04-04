beverage <- c( "B1 - Caffe` Americano",
               "B2 - Flat White",
               "B3 - Pure Matcha Latte",
               "B4 - Signature Chocolate",
               "B5 - Yuzu Black Tea",
               "B6 - Pink Drink",
               "B7 - Chai Tea Latte",
               "B8 - Hojicha Tea Latte")

hightlight_b <- c( "H1 - Pistachio White Chocolate Machiato",
                   "H2 - Iced Pistachio White Chocolate Machiato",
                   "H3 - Pistachio White Chocolate Frappuccino",
                   "H4 - Strawberry Cookie Crumble Cream Frappuccino")

size <- c( "S1 - Tall",
           "S2 - Grande",
           "S3 - Venti" )

H_C <- c( "Hot",
          "Cold")

payment <- c( "Cash",
              "Qr Payment",
              "Card" )

Rosie_cafe <- function() {
  
  cat(" Hello sir, welcome to Rosie Cafe. Here is your menus.\n ")
  cat("----------------------------------------------------------\n ")
  cat(" Instructions ")
  cat(" type 'Exit' to exit Rosie cafe bot\n ")
  cat(" type 'See the Menu' to see all Beverage menus\n ")
  cat(" type 'Highlight' to see Highlight menus for today\n ")
  cat(" type 'Order' to Order for today\n ")
  cat("----------------------------------------------------------\n ")
  cat(" Beverage Menu\n ")
  cat("-" ,beverage[1], "\n")
  cat("-" ,beverage[2], "\n")
  cat("-" ,beverage[3], "\n")
  cat("-" ,beverage[4], "\n")
  cat("-" ,beverage[5], "\n")
  cat("-" ,beverage[6], "\n")
  cat("-" ,beverage[7], "\n")
  cat("-" ,beverage[8], "\n")
  cat("- Highlight for today \n")
  
  while(TRUE) {
    start = readline("What can I get for you, sir? : ")
    if ( start == "Exit" ) {
      print(" Thank you for using Rosie cafe bot ")
      break
    } else if ( start == "Highlight" ) {
      highlight <- print(sample(hightlight_b,1))
    } else if ( start == "See the Menu" ) {
      print(beverage)
    } else if ( start == "Order") {
      print("What would you like to order?")
      cat(" type code for order the menus\n ")
    }
    
    order <- readline("I would like to order : ")
    if (order == "B1") {
      print(beverage[1])
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "B2") {
      print(paste("Your order is : " ,beverage[2]))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "B3") {
      print(paste("Your order is : " ,beverage[3]))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "B4") {
      print(paste("Your order is : " ,beverage[4]))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "B5") {
      print(paste("Your order is : " ,beverage[5]))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "B6") {
      print(paste("Your order is : " ,beverage[6]))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "B7") {
      print(paste("Your order is : " ,beverage[7]))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "B8") {
      print(paste("Your order is : " ,beverage[8]))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    } else if (order == "highlight for today") {
      print(paste("Your order is : " ,highlight))
      cat("We have 3 size : S1- tall , S2-grande , S3-venti \n") 
    }
    
    size_b <- readline ("What size do you like? : ")
    if (size_b == "S1") {
      print(paste("I would like :" , size[1]))
    } else if (size_b == "S2") {
      print(paste("I would like :" , size[2]))
    } else if (size_b == "S3") {
      print(paste("I would like :" , size[3]))
    }
    
    h_c <- readline ("Hot or Cold? : ")
    if (h_c == "Hot") {
      print(paste("Ok,", H_C[1]))
    } else if (h_c == "Cold") {
      print(paste("Ok,", H_C[2]))
    }
    
    Pay <- readline ("Would you like to pay by cash, qr code or card?")
    if (Pay == "cash") {
      print(paste("I will pay by : ", payment[1] ))
    } else if (Pay == "qr code") {
      print(paste("I will pay by : " ,payment[2] ))
    } else if (Pay == "card") {
      print(paste("I will pay by : ", payment[3] ))
    }
    
    name <- readline("Can I have your name?")
    print(paste("Thank you for you order,", toupper(name) ))
    
    Total <- print(paste("Your total order has",h_c,order,size_b))
    cat("       >>> Have a nice day! <<<       ")
    break
    
  }
}
