//
//  Day13.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/12/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation


func ==(lhs: People, rhs: People) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

//Shuffle from
//http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

struct People: Hashable {
    var person: String
    var about: String
    init(_ a: String, _ b: String) {
        self.person = a;
        self.about = b;
    }
    var hashValue : Int {
        get {
            return "\(self.person),\(self.about)".hashValue
        }
    }
}

func day13(input: String, _ part: Part) -> Int {
    
    var data = Dictionary<People, Int>()
    
    input.enumerateLines { (line, stop) -> () in
        let name = (line =~ "[A-Z][a-z]+").items[0]
        let about = (line =~ "[A-Z][a-z]+").items[1]
        
        let good = (line =~ "lose").items.count == 0 ? true : false
        let amount = Int((line =~ "[0-9]+").items[0])! * (good ? 1 : -1)
        
        data[People(name, about)] = amount
    }
    
    func calculateHappiness(order: [String]) -> Int {
        var happiness = 0
        
        for (i, p) in order.enumerate() {
            if i == order.count - 1 {
                happiness += data[People(p, order[0])]!
            } else {
                happiness += data[People(p, order[i + 1])]!
            }
            if i == 0 {
                happiness += data[People(p, order.last!)]!
            } else {
                happiness += data[People(p, order[i - 1])]!
            }
        }
        
        return happiness
    }
    
    func getRandom() -> [String] {
        //Yup I know
        if part == .First {
            return ["Bob", "Alice", "Carol", "David", "Eric", "Frank", "George", "Mallory"].shuffle()
        } else {
            return ["Bob", "Alice", "Carol", "David", "Eric", "Frank", "George", "Mallory", "Ezekiel"].shuffle()
        }
    }
    
    var best = Int.min
    
    for _ in 0...100000 {
        let h = calculateHappiness(getRandom())
        if h > best {
            best = h
        }
    }
    
    return best
}