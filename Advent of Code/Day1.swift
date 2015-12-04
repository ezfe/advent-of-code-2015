//
//  Day1.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/3/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func day1(input: String, _ part: Part) -> Int {
    var floor = 0
    
    for (i, char) in input.characters.enumerate() {
        switch char {
        case "(":
            floor += 1
        case ")":
            floor -= 1
        default:
            print("Did not recoginize \(char)")
        }
        if floor == -1 && part == Part.Second {
            return i + 1
        }
    }
    
    return floor
}
