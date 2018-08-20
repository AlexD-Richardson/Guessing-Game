//
//  main.swift
//  Guessing Game
//
//  Created by Alex Richardson on 8/16/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

/* -First come up with random number between 0 and 100
 -Then tell the user that they only get 5 tries
 -let user guess a number make sure to validate that they put in a number
 -check the user’s guess to see if it matches -> Guess == Num Correct  || Guess < Num Give Feedback || Guess > Num Give Feedback
 -if they have more guesses left then tell them if their guess needs to be higher or lower
 -repeat process until user gets it or runs out of guesses.
 -if user runs out of guesses then check to see if they want to quit or restart game
 -if the user gets it in 5 tries then congratulate them and ask them if they want to quit or restart and play again.
 */

var playAgain = true

repeat {
    
    
    let randomNumber = Int(arc4random_uniform(99)) + 1
    var numberOfTries = 5
    var guessedNumber: Int? = nil
    
    print("Guess a random number between 1 and 100. You only get 5 tries. Good luck!")
    repeat {
        
        repeat {
            
            let input = readLine()!
            if input == "cheat" {
                print("Hey you figured out the cheat! The secret number is \(randomNumber)")
            }
            if let number = Int(input) {
                guessedNumber = number
            } else {
                print("Please enter a number")
                guessedNumber = nil
            }
        } while guessedNumber == nil
        
        guard let guessedNumber = guessedNumber else {
            print("You didn't guess a number!")
            fatalError()
        }
        
       if guessedNumber > 100 || guessedNumber < 0 {
            print("Please enter a number between 1 and a 100.")
        } else if guessedNumber == randomNumber {
            print("Congratulations! You have bested me!")
            break
        } else if guessedNumber < randomNumber {
            numberOfTries = numberOfTries - 1
            if numberOfTries == 0 {
                
            } else {
                print("Guess a higher number")
            }
        } else if guessedNumber > randomNumber {
            numberOfTries = numberOfTries - 1
            if numberOfTries == 0 {
                
            } else {
                print("Guess a lower number")
            }
            
        }
        
        if numberOfTries == 1 {
            print("This is your last try. May the best mind win")
        }
        else if numberOfTries == 0 {
            print("Good Game!")
        }
            
        else {
            print("You have \(numberOfTries) number of tries left")
        }
        if numberOfTries == 0 {
            print("Looks like I have bested you. The answer was \(randomNumber)")
        }
        
        
        
        
    } while numberOfTries > 0 || guessedNumber == randomNumber
    
    
    print("Would you like to play again? Please answer with a y or n")
    
    let input = readLine()!
    
    //This line just makes that if they enter in an upper case then it typecasts it to a lower case
    playAgain = input.lowercased() == "y"
    
    
    
} while playAgain == true






