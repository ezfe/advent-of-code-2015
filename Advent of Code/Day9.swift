
//
//  Day9.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/9/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

func ==(lhs: City, rhs: City) -> Bool {
    return lhs.name == rhs.name
}
func ==(lhs: Road, rhs: Road) -> Bool {
    let (La, Lb) = lhs.cities
    let (Ra, Rb) = rhs.cities
    return La == Ra && Lb == Rb
}

class City: CustomStringConvertible, Hashable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    var description: String {
        get {
            return "City of \(name)"
        }
    }
    var hashValue : Int {
        get {
            return description.hashValue
        }
    }
}

class Road: CustomStringConvertible, Hashable {
    let cities: (City, City)
    let distance: Int
    
    init(cities: (City, City), distance: Int) {
        self.cities = cities
        self.distance = distance
    }
    var description: String {
        get {
            let (a, b) = self.cities
            return "\(a) -> \(b) (\(self.distance))"
        }
    }
    var hashValue : Int {
        get {
            return description.hashValue
        }
    }
}

func day9(input: String, _ part: Part) -> Int {
    
    var cities = Set<City>()
    var connections = Set<Road>()
    
    input.enumerateLines { (line, stop) -> () in
        let names = line =~ "[A-Za-z]+"
        let distance = line =~ "[0-9]+"
        
        guard let a = names.items.first, let b = names.items.last, let dS = distance.items.first, let d = Int(dS) else {
            print("No Match")
            return
        }
        
        let CA = City(name: a)
        let CB = City(name: b)
        let R = Road(cities: (CA, CB), distance: d)
        
        cities.insert(CA)
        cities.insert(CB)
        
        connections.insert(R)
    }
    
    func getConnection(a: City, b: City) -> Road {
        for connection in connections {
            let (CA, CB) = connection.cities
            if (CA == a && CB == b) || (CA == b && CB == a) {
                return connection
            }
        }
        assertionFailure()
        return Road(cities: (City(name: "NA"), City(name: "NAdistance: 2")), distance: -999)
    }
    
    var shortest = Int.max
    var longest = 0
    var current = 0
    
    
    
    
    return -1
}
