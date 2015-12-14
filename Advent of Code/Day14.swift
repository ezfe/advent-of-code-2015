//
//  Day14.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/14/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

/*
Dancer can fly 27 km/s for 5 seconds, but then must rest for 132 seconds.
Cupid can fly 22 km/s for 2 seconds, but then must rest for 41 seconds.
Rudolph can fly 11 km/s for 5 seconds, but then must rest for 48 seconds.
Donner can fly 28 km/s for 5 seconds, but then must rest for 134 seconds.
Dasher can fly 4 km/s for 16 seconds, but then must rest for 55 seconds.
Blitzen can fly 14 km/s for 3 seconds, but then must rest for 38 seconds.
Prancer can fly 3 km/s for 21 seconds, but then must rest for 40 seconds.
Comet can fly 18 km/s for 6 seconds, but then must rest for 103 seconds.
Vixen can fly 18 km/s for 5 seconds, but then must rest for 84 seconds.
*/

class Reindeer {
    let speed: Int
    let fly: Int
    let rest: Int
    
    var distance = 0
    var flyTime = 0
    var restTime = 0
    var flying = true
    
    var pts = 0
    
    init(_ speed: Int, _ fly: Int, _ rest: Int) {
        self.speed = speed
        self.fly = fly
        self.rest = rest
    }
    
    func tick() {
        if flying {
            flyTime++
            distance += speed
            if fly <= flyTime {
                flying = false
                flyTime = 0
                restTime = 0
            }
        } else {
            restTime++
            if rest <= restTime {
                flying = true
                restTime = 0
                flyTime = 0
            }
        }
    }
}

func day14(part: Part) -> Int {
    let reindeer = [Reindeer(27, 5, 132), Reindeer(22, 2, 41), Reindeer(11, 5, 48), Reindeer(28, 5, 134), Reindeer(4, 16, 55), Reindeer(14, 3, 38), Reindeer(3, 21, 40), Reindeer(18, 6, 103), Reindeer(18, 5, 84)]
    
    for _ in 1...2503 {
        for r in reindeer {
            r.tick()
        }
        
        
        if part == .Second {
            var max = reindeer.first!.distance
            
            for r in reindeer {
                if r.distance > max {
                    max = r.distance
                }
            }
            
            for r in reindeer {
                if r.distance == max {
                    r.pts += 1
                }
            }
        }
    }
    
    var max = reindeer.first!.pts
    
    for r in reindeer {
        if part == .First {
            if r.distance > max {
                max = r.distance
            }
        } else {
            if r.pts > max {
                max = r.pts
            }
        }
    }
    
    return max
}