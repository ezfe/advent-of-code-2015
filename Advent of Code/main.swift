//
//  main.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/3/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

enum Part: Int {
    case First = 1, Second = 2
}

let fm = NSFileManager()

if Process.arguments.count < 4 || Process.arguments.count >= 5 {
    print("adventofcode [day] [part] [input]")
    exit(0)
}

let input = String(try! NSString(contentsOfFile: Process.arguments[3], encoding: NSUTF8StringEncoding))

print(day10(input, Part.First))

//print(day3(input, Part.First))

//let p = Part(rawValue: Int(Process.arguments[2])!)!
//
//switch Int(Process.arguments[1])! {
//case 1:
//    print(day1(input, p))
//case 2:
//    print(day2(input, p))
//case 3:
//    print(day3(input, p))
//case 4:
//    print(day4(input, p))
//default:
//    print("Not a valid day :(")
//}