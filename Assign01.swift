import Foundation
import Glibc
//
//  Assign01.swift
//
//  Created by Alex De Meo
//  Created on 2023/02/11
//  Version 1.0
//  Copyright (c) 2023 Alex De Meo. All rights reserved.
//
//  This program calculates the Energy released when mass.
// is converted to energy

// creating constants and variables
var pickerLoop = true
var noErrors = false
var inputLoop = true
var answerLoop = true
let abs0 = -273.15

repeat {
    noErrors = false
    inputLoop = true
    answerLoop = true
    print("You have two options, to choose an option, enter"
        + " the corresponding number. \n1 - Celsius to Fahrenheit and"
        + " Kelvin conversion.\n2 - Final Exam permitter\nChoice: ")
    if let choice = Int(readLine()!) {
        if (choice == 1) {
            repeat {
                print("Enter the temperature in celsius: ", terminator: "")
                if let celsiusDegrees = Double(readLine()!) {
                    if (celsiusDegrees >= abs0) {
                        let kelvinDegrees = kelvinDeg(celsius: celsiusDegrees)
                        let fhtDegrees = fahrenheitDeg(celsius: celsiusDegrees)
                        print(String(format: "The temperature in " 
                            + "Fahrenheit is %.2f°F and in"
                            + "Kelvin it is %.2f°K", fhtDegrees , kelvinDegrees)
                            )
                        inputLoop = false
                        noErrors = true
                    } else {
                        print("The temperature can't be less than Absolute 0")
                    }
                } else {
                    print("Invalid input, please try again!")
                }
            } while(inputLoop)
        } else if (choice == 2) {
            repeat {
                print("Enter your attendance as a percentage (exclude '%'): ",
                terminator: "")
                if let attendance = Double(readLine()!) {
                    if (attendance <= 100 && attendance >= 0) {
                        let canWriteExam = canWrite(attendance: attendance)
                        if (canWriteExam) {
                            print("You can write the exam!")
                        } else {
                            print("Your attendance was insufficient this "
                                + "semester, therefor you can't write the exam")
                        }
                        noErrors = true
                        inputLoop = false
                    } else {
                        print("Input must be in range 0-100")
                    }
                } else {
                    print("That input was invalid.")
                }
            } while (inputLoop)
        } else {
            print("That was not an option, try again!")
        }
        if (noErrors) {
            repeat {
                print(
                    "Would you like to do another problem? (y/n): ", 
                    terminator: "")
                let answer = readLine()!
                if (answer == "y") {
                    answerLoop = false
                } else if (answer == "n") {
                    pickerLoop = false
                    answerLoop = false
                } else {
                    print("That is not an option, please try again!")
                }
            } while (answerLoop)
        }
    } else {
        print("That was not an option, try again!")
    }
} while (pickerLoop)

func kelvinDeg(celsius: Double) -> Double {
    let kelvin = celsius + 273.15
    return kelvin
}

func fahrenheitDeg(celsius: Double) -> Double {
    let fahrenheit = ((9.0 / 5.0) * celsius) + 32
    return fahrenheit
}

func canWrite(attendance: Double) -> Bool {
    if (attendance >= 75) {
        return true
    } else {
        return false
    }
}