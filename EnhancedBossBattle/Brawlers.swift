//
//  Brawlers.swift
//  EnhancedBossBattle
//
//  Created by ABA Lab on 10/27/17.
//  Copyright © 2017 ABA Lab. All rights reserved.
//

import Foundation

class Brawlers {
    let initHP : Int
    let finalHP : Int
    let weapon : String
    
    init(initHP : Int, finalHP : Int, weapon : String) {
        self.initHP = initHP
        self.finalHP = finalHP
        self.weapon = weapon
    }
}
