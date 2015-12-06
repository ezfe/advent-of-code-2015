//
//  Day6.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/5/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func rangeFromNSRange(nsRange: NSRange, forString str: String) -> Range<String.Index>? {
    let fromUTF16 = str.utf16.startIndex.advancedBy(nsRange.location, limit: str.utf16.endIndex)
    let toUTF16 = fromUTF16.advancedBy(nsRange.length, limit: str.utf16.endIndex)
    
    
    if let from = String.Index(fromUTF16, within: str),
        let to = String.Index(toUTF16, within: str) {
            return from ..< to
    }
    
    return nil
}

func day6(input: String, _ part: Part) -> Int {
    let strings = input.characters.split(isSeparator: {$0 == "\n"})
    
    var first = Array(count:1000, repeatedValue:Array(count:1000, repeatedValue:false))
    var second = Array(count:1000, repeatedValue:Array(count:1000, repeatedValue:0))
    
    func turnOff(x: Int, _ y: Int) {
        first[x][y] = false
        second[x][y] -= 1
        if second[x][y] < 0 {
            second[x][y] = 0
        }
    }
    func turnOn(x: Int, _ y: Int) {
        first[x][y] = true
        second[x][y] += 1
    }
    func toggle(x: Int, _ y: Int) {
        first[x][y] = !first[x][y]
        second[x][y] += 2
    }
    
    for s in strings {
        let str = String(s)
        var (x1, y1, x2, y2): (Int?, Int?, Int?, Int?) = (nil, nil, nil, nil)
        do {
            let input = str
            let regex = try NSRegularExpression(pattern: "([0-9]+),([0-9]+)", options: NSRegularExpressionOptions.CaseInsensitive)
            let matches = regex.matchesInString(input, options: [], range: NSMakeRange(0, input.characters.count))
            
            if let swiftRange = rangeFromNSRange(matches[0].rangeAtIndex(1), forString: input) {
                x1 = Int(input.substringWithRange(swiftRange))
            }
            if let swiftRange = rangeFromNSRange(matches[0].rangeAtIndex(2), forString: input) {
                y1 = Int(input.substringWithRange(swiftRange))
            }
            if let swiftRange = rangeFromNSRange(matches[1].rangeAtIndex(1), forString: input) {
                x2 = Int(input.substringWithRange(swiftRange))
            }
            if let swiftRange = rangeFromNSRange(matches[1].rangeAtIndex(2), forString: input) {
                y2 = Int(input.substringWithRange(swiftRange))
            }
            
        } catch {
            // regex was bad!
        }
        
        if let x1 = x1, let y1 = y1, let x2 = x2, let y2 = y2 {
            for y in y1...y2 {
                for x in x1...x2 {
                    if str.hasPrefix("turn off") {
                        turnOff(x, y)
                    } else if str.hasPrefix("toggle") {
                        toggle(x, y)
                    } else if str.hasPrefix("turn on") {
                        turnOn(x, y)
                    }
                }
            }
        }
        
    }
    
    var firstSum = 0
    var secondSum = 0
    
    for x in 0...999 {
        for y in 0...999 {
            secondSum += second[x][y]
            if first[x][y] {
                firstSum += 1
            }
        }
    }
    
    if part == .First {
        return firstSum
    } else {
        return secondSum
    }
}