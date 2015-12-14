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

print(day14(Part.Second))