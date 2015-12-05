
//  Day5.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/4/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func day5(input: String, _ part: Part) -> Int {
    let strings = input.characters.split(isSeparator: {$0 == "\n"})
    var sum = 0
    for str in strings {
        if part == Part.First {
            var vowels = 0
            
            var index = str.startIndex
            var foundRepeat = false
            
            var failsSecond = false
            for i in 0..<str.count {
                if i < str.count - 1 {
                    if str[index] == str[index.advancedBy(1)] {
                        foundRepeat = true
                    }
                    if str[index] == "a" && str[index.advancedBy(1)] == "b" {
                        failsSecond = true
                    }
                    if str[index] == "c" && str[index.advancedBy(1)] == "d" {
                        failsSecond = true
                    }
                    if str[index] == "p" && str[index.advancedBy(1)] == "q" {
                        failsSecond = true
                    }
                    if str[index] == "x" && str[index.advancedBy(1)] == "y" {
                        failsSecond = true
                    }
                }
                if ["a","e","i","o","u"].contains(str[index]) {
                    vowels += 1
                }
                
                index = index.advancedBy(1)
            }
            if !failsSecond && foundRepeat && vowels >= 3 {
                sum += 1
            }
        } else {
            let string = String(str)
            var firstChallenge = false
            var secondChallenge = false
            var index = string.startIndex
            for i in 0..<string.characters.count {
                if i < string.characters.count - 2 {
                    if string[index] == string[index.advancedBy(2)] {
                        secondChallenge = true
                    }
                }
                if i < string.characters.count - 1 {
                    let range = Range<String.Index>(start: index, end: index.advancedBy(2))
                    let pair = string.substringWithRange(range)
                    
                    var pairLooper = string.startIndex
                    for x in 0..<string.characters.count {
                        if x < string.characters.count - 1 {
                            let secondRange = Range<String.Index>(start: pairLooper, end: pairLooper.advancedBy(2))
                            let secondPair = string.substringWithRange(secondRange)
                            
                            if pair == secondPair {
                                if range.startIndex >= secondRange.endIndex || range.endIndex <= secondRange.startIndex {
                                    firstChallenge = true
                                }
                            }
                            
                        }
                        pairLooper = pairLooper.advancedBy(1)
                    }
                    
                }
                index = index.advancedBy(1)
            }
            if firstChallenge && secondChallenge {
                sum += 1
            }
        }
    }
    return sum
}