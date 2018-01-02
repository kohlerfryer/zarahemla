//
//  Util.swift
//  zarahemla
//
//  Created by Kitty Katt on 1/2/18.
//  Copyright © 2018 dreamboundlabs. All rights reserved.
//

import Foundation

class Util{
    
    public static func getRandomNumber(lowerBound: Int, upperBound: Int) -> Int {
        return  Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1))) +   lowerBound
    }
    
}
