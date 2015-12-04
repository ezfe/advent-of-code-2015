//
//  Day3.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/3/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func ==(lhs: Coord, rhs: Coord) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

struct Coord: Hashable {
    var x: Int
    var y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x;
        self.y = y;
    }
    var hashValue : Int {
        get {
            return "\(self.x),\(self.y)".hashValue
        }
    }
    
    
}

func day3(input: String, _ part: Part) -> Int {
    let UP = "^"
    let DOWN = "v"
    let RIGHT = ">"
    let LEFT = "<"
    
    var database = Dictionary<Coord, Int>()
    var santaLocation = Coord(0, 0)
    var robotLocation = Coord(0, 0)
    
    if part == Part.First {
        database[Coord(0, 0)] = 1
    } else if part == Part.Second {
        database[Coord(0, 0)] = 2
    }
    
    for (i,c) in input.characters.enumerate() {
        let char = String(c)
        if i % 2 == 0 && part == Part.Second {
            if char == UP {
                robotLocation.y += 1
            } else if char == DOWN {
                robotLocation.y -= 1
            } else if char == RIGHT {
                robotLocation.x += 1
            } else if char == LEFT {
                robotLocation.x -= 1
            }
            if let c = database[Coord(robotLocation.x, robotLocation.y)] {
                database[Coord(robotLocation.x, robotLocation.y)] = c+1;
            } else {
                database[Coord(robotLocation.x, robotLocation.y)] = 1
            }
            
        } else {
            if char == UP {
                santaLocation.y += 1
            } else if char == DOWN {
                santaLocation.y -= 1
            } else if char == RIGHT {
                santaLocation.x += 1
            } else if char == LEFT {
                santaLocation.x -= 1
            }
            if let c = database[Coord(santaLocation.x, santaLocation.y)] {
                database[Coord(santaLocation.x, santaLocation.y)] = c+1;
            } else {
                database[Coord(santaLocation.x, santaLocation.y)] = 1
            }
            
        }
        
    }
    return database.count
}