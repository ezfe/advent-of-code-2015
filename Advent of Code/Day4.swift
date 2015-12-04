//
//  Day4.swift
//  Advent of Code
//
//  Created by Ezekiel Elin on 12/4/15.
//  Copyright © 2015 Ezekiel Elin. All rights reserved.
//

import Foundation

extension String  {
    var md5: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.dealloc(digestLen)
        
        return String(format: hash as String)
    }
}

func day4(input: String, _ part: Part) -> Int {
    var i = 7000000
    while true {
        let res = "\(input)\(i)".md5
        var start = res.startIndex;
        if res[start] == "0" {
            start = start.advancedBy(1)
            if res[start] == "0" {
                start = start.advancedBy(1)
                if res[start] == "0" {
                    start = start.advancedBy(1)
                    if res[start] == "0" {
                        start = start.advancedBy(1)
                        if res[start] == "0" {
                            start = start.advancedBy(1)
                            if part == Part.First {
                                return i
                            } else if res[start] == "0" {
                                return i
                            }
                        }
                    }
                }
            }
        }
        i += 1
    }
}