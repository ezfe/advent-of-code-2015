//
//  Day11.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/11/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func day11(input: String, _ part: Part) -> String {
    
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    func incrementIndex(pw: String, _ index: String.CharacterView.Index) -> String {
        var working = pw
        if pw[index] == "z" && index != pw.startIndex {
            working = pw[pw.startIndex..<index] + "a"
            if pw.endIndex > index.successor() {
                working = working + pw[index.successor()..<pw.endIndex]
            }
            return incrementIndex(working, index.predecessor())
        } else if pw[index] == "z" && index == pw.startIndex {
            working = "a"
            if pw.endIndex > index.successor() {
                working = working + pw[index.successor()..<pw.endIndex]
            }
            return working
//            return incrementIndex(working, pw.endIndex.predecessor())
        } else {
            let cchar = pw[index]
            let cindex = alphabet.indexOf(String(cchar))!
            let nchar = alphabet[cindex + 1]
            
            working = pw[pw.startIndex..<index] + nchar
            
            if pw.endIndex > index.successor() {
                working = working + pw[index.successor()..<pw.endIndex]
            }
            return working
        }
    }
    
    func check(res: String) -> Bool {
        if res.characters.indexOf("i") != nil {
            return false
        }
        if res.characters.indexOf("l") != nil {
            return false
        }
        if res.characters.indexOf("o") != nil {
            return false
        }
       
        if res =~ "(.)\\1.*(.)\\2" {
            let results = (res =~ "(.)\\1")
            if results.items[0] == results.items[1] {
                return false
            }
        } else {
            return false
        }
        
        if !(res =~ "(abc|bcd|cde|def|efg|fgh|pqr|qrs|rst|stu|tuv|uvw|vwx|wxy|xyz)") {
            return false
        }
        
        return true
    }
    
    var result = input
    repeat {
        result = incrementIndex(result, result.endIndex.predecessor())
    } while !check(result);
    if part == .First {
        print(result)
    } else {
        repeat {
            result = incrementIndex(result, result.endIndex.predecessor())
        } while !check(result);
        print(result)
    }
    return ""
}