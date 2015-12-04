//
//  Day2.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/3/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func day2(input: String, _ part: Part) -> Int {
    let presents = input.characters.split(isSeparator: {$0 == "\n"})
    
    var wrappingPaper = 0
    var ribbon = 0
    
    for present in presents {
        let dimensions = present.split(isSeparator: {$0 == "x"})
        let length = Int(String(dimensions[0]))!
        let width = Int(String(dimensions[1]))!
        let height = Int(String(dimensions[2]))!
        
        let sideA = 2 * length * width
        let sideB = 2 * width * height
        let sideC = 2 * height * length
        
        wrappingPaper += sideA + sideB + sideC
        wrappingPaper += min(min(sideA, sideB), sideC)
        
        if length > height && length > width {
            ribbon += 2 * height + 2 * width
        } else if height > length && height > width {
            ribbon += 2 * length + 2 * width
        } else {
            ribbon += 2 * length + 2 * height
        }
        ribbon += length * width * height
    }
    
    if part == Part.Second {
        return ribbon
    }
    return wrappingPaper
}