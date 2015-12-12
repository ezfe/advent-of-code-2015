//
//  Day12.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/12/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func day12(input: String, _ part: Part) -> Int {
    
    let obj = JSON(input)
    
    let json: JSON
    if let dataFromString = input.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
        json = JSON(data: dataFromString)
    } else {
        json = JSON("")
    }
    
    func parseObj(obj: JSON) -> Int {
        if let arr = obj.array {
            var sum = 0
            for i in arr {
                sum += parseObj(i)
            }
            return sum
        } else if let dict = obj.dictionary {
            var sum = 0
            for (key, subJSON):(String, JSON) in dict {
                if part == .Second && (key == "red" || subJSON.stringValue == "red") {
                    return 0
                }
                sum += parseObj(subJSON)
            }
            return sum
        } else if let iob = obj.int {
            return iob
        } else {
            return 0
        }
    }
    
    return parseObj(json)
}