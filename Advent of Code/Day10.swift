//
//  Day10.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/10/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func day10(inpt: String, _ part: Part) -> Int {
    
    var input = Array<Int>()
    
    for i in inpt.characters {
        input.append(Int(String(i))!)
    }
    
    func lookSay(num: [Int]) -> [Int] {
        
        var ret = [Int]()
        
        var i = 0;
        while i < num.count {
            
            if i >= (num.count - 1) || num[i] != num[i+1] {
                ret.append(1)
                ret.append(num[i])
                i++
            } else {
                var endIndex = i + 1
                
                while true {
                    if num[endIndex] == num[endIndex + 1] {
                        endIndex += 1
                    } else {
                        break
                    }
                }

                let count = endIndex + 1 - i
                if "\(count)".characters.count > 1 {
                    for i in "\(count)".characters {
                        ret.append(Int(String(i))!)
                    }
                } else {
                    ret.append(count)
                }
                ret.append(num[i])
                
                i = endIndex + 1
            }
        }
        
        return ret
    }
 
    for _ in 1...50 {
        input = lookSay(input)
    }
    
    var str = ""
    for i in input {
        str = "\(str)\(i)"
    }
    
    return str.characters.count
}