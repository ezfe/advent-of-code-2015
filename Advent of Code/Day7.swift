//
//  Day7.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/7/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func day7(input: String, _ part: Part) -> Int {
    let instrStrings = input.characters.split(isSeparator: {$0 == "\n"})
    
    var instructions = Dictionary<String, String>()
    var cache = Dictionary<String, Int>()
    
    for instr in instrStrings {
        let instructionString = String(instr)
        let matches = instructionString =~ "[a-z]+"
        let wire = matches.items.last!
        instructions[wire] = instructionString
    }
    
    func parseDoubleVal(instr: String) -> (Int, Int) {
        let first = (instr =~ "[a-z|0-9]+").items[0]
        let second = (instr =~ "[a-z|0-9]+").items[1]
        
        let firstValue: Int
        let secondValue: Int
        if let fV = Int(first) {
            firstValue = fV
        } else {
            firstValue = getWire(first)
        }
        if let sV = Int(second) {
            secondValue = sV
        } else {
            secondValue = getWire(second)
        }
        
        return (firstValue, secondValue)
    }
    
    func parseSingle(instr: String) -> Int {
        let first = (instr =~ "[a-z|0-9]+").items[0]
        
        let firstValue: Int
        if let fV = Int(first) {
            firstValue = fV
        } else {
            firstValue = getWire(first)
        }
        
        return firstValue
    }
    
    func getWire(wire: String) -> Int {
        defer {
            print("Fetched \(wire)")
        }
        
        let retVal: Int
        
        if let val = cache[wire] {
            return val
        }
        
        guard let instr = instructions[wire] else {
            print("\(wire) is not valid")
            return 0
        }
        
        if instr =~ "^[0-9]+ ->" {
            //Super bad
            retVal = Int((instr =~ "[0-9]+").items.first!)!
        } else if instr =~ "^[a-z]+ ->" {
            let wire = (instr =~ "[a-z]+").items.first!
            retVal = getWire(wire)
        } else if instr =~ "AND" { //
            let (firstValue, secondValue) = parseDoubleVal(instr)
            retVal = (firstValue & secondValue)
        } else if instr =~ "LSHIFT" {
            let (firstValue, secondValue) = parseDoubleVal(instr)
            retVal = (firstValue << secondValue)
        } else if instr =~ "NOT" {
            let firstValue = parseSingle(instr)
            retVal = (~firstValue)
        } else if instr =~ "OR" {
            let (firstValue, secondValue) = parseDoubleVal(instr)
            retVal = (firstValue | secondValue)
        } else if instr =~ "RSHIFT" {
            let (firstValue, secondValue) = parseDoubleVal(instr)
            retVal = (firstValue >> secondValue)
        } else {
            print("Um")
            retVal = -1
        }
        
        cache[wire] = retVal
        return retVal
    }
    
    let a = getWire("a")
    
    if part == .First {
        return a
    } else {
        let b = getWire("a")
        cache = Dictionary<String, Int>()
        cache["b"] = b
        return getWire("a")
    }
    
    return -1
}