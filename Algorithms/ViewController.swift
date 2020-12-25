//
//  ViewController.swift
//  Algorithms
//
//  Created by Sowrirajan S on 26/12/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let string = ")){[(]}("
        print(balancedBracket(string: string))


        let result = isAnagramString(stringOne: "Sugumaran", stringTwo: "maransugu")
        print(result)
        
    }
    
    //MARK:- 1). Balancing brackets
    func balancedBracket(string: String) -> Bool {
            var input = string
            for _ in string {
                if string.contains("[") && string.contains("]") {
                    if let open = input.firstIndex(of: "[") {
                        input.remove(at: open)
                    }
                    if let close = input.firstIndex(of: "]") {
                        input.remove(at: close)
                    }
                }
                
                if input.contains("{") && input.contains("}") {
                    if let open = input.firstIndex(of: "{") {
                        input.remove(at: open)
                    }
                    if let close = input.firstIndex(of: "}") {
                        input.remove(at: close)
                    }
                }
                
                if input.contains("(") && input.contains(")") {
                    if let open = input.firstIndex(of: "(") {
                        input.remove(at: open)
                    }
                    if let close = input.firstIndex(of: ")") {
                        input.remove(at: close)
                    }
                }
            }
            // ANOTHER APPROACH BUT NOT SOLVED
    //        if char == "(" && string.contains(")") {
            ////                    print("F", str)
            ////                    if let closing = input.index(of: ")") {
            ////                        print("S", str)
            ////                        input.remove(at: index)
            ////                        input.remove(at: closing)
            ////                        print("input( ==>> ", input)
            ////
            ////                    }
            ////                }
            print(input)
            if input.count != 0 { return false }
            return true
    }


    //MARK:- 2). Needed max number of platforms to land more than train at same time
    func maxPaltforms() {
        var arrivalTimeArray = [900, 940, 950, 1100, 1500, 1800]
        var departureTimeArray = [910, 1200, 1120, 1130, 1900, 2000]
        var maxPlatform = 0
        var neededPlatform = 0
        var arrivalTime = 0
        var departureTime = 0
        var arrIndex = 0
        var depIndex = 0

        arrivalTimeArray = arrivalTimeArray.sorted()
        departureTimeArray = departureTimeArray.sorted()


        print("Arrival Times ", arrivalTimeArray)
        print("Departure Times ", departureTimeArray)

        for _ in 0 ... 9 {
            arrivalTime = arrivalTimeArray[arrIndex]
            departureTime = departureTimeArray[depIndex]
            print("Times ", arrivalTime, departureTime)
            if arrivalTime < departureTime {
                arrIndex += 1
                maxPlatform += 1
            } else {
                depIndex += 1
                maxPlatform -= 1
            }
            print("Indexes ", arrIndex, depIndex)
            
            if arrIndex > depIndex {
            } else {
            }
            
            if arrIndex == depIndex {
                maxPlatform = 0
            }
            
            if maxPlatform > neededPlatform {
                neededPlatform += 1
            }
            print("Platforms ", maxPlatform, neededPlatform)
            print("\n\n")
        }
    }
    

    //MARK:- 3). ANAGRAM
    // Solution 1
    func isAnagramString(stringOne: String, stringTwo: String) -> Bool {
        
        guard stringOne.count == stringTwo.count else { return false }
        var nameOne = stringOne.lowercased()
        var nameTwo = stringTwo.lowercased()
        
        for i in 0 ..< nameOne.count {
            let index = stringOne.index(stringOne.startIndex, offsetBy: i)
            let charecter = stringOne.lowercased()[index]
            print(charecter)
            if let charO = nameOne.firstIndex(of: charecter),
                let charT = nameTwo.firstIndex(of: charecter) {
                nameOne.remove(at: charO)
                nameTwo.remove(at: charT)
            }
        }
        if nameOne.count & nameTwo.count != 0 {
            print(nameOne, nameTwo)
            return false
        }
        return true
    }

    // solution 2
    func isAnagram(word1: String,word2: String) -> Bool {
        return word1.lowercased().sorted() == word2.lowercased().sorted()
    }
    
    //MARK:-  4). Equlibriam Index
    func equlibiriamIndex() {
        let array = [-7, 1, 5, 2, -4, 3, 0]

        var leftSum = 0
        var rightSum = 0

        var sumArray: [Int] = []
        var sumValue = 0

        for item in array {
            sumValue += item
            sumArray.append(sumValue)
        }

        for j in 1..<array.count-1 {
            leftSum = sumArray[j] - array[j]
            rightSum = sumArray[sumArray.count-1] - sumArray[j]
            
            if leftSum == rightSum {
                print("Equlibriam index ==>> ", j)
                break
            }
        }
        print(sumArray)
    }

}

