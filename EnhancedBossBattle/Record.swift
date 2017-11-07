//
//  Record.swift
//  EnhancedBossBattle
//
//  Created by ABA Lab on 10/20/17.
//  Copyright © 2017 ABA Lab. All rights reserved.
//

import Foundation
//TODO: CREATE RECORD CLASS

class Record {
    let winner : String
    let bossWeapon: String
    let heroWeapon: String
    let winnerHP: Int
    let heroStartHP: Int
    let bossStartHP: Int
    
    
    init(winner: String, bossWeapon: String, heroWeapon: String, winnerHP: Int, heroStartHP: Int, bossStartHP: Int){
        self.winner = winner
        self.bossWeapon = bossWeapon
        self.heroWeapon = heroWeapon
        self.winnerHP = winnerHP
        self.heroStartHP = heroStartHP
        self.bossStartHP = bossStartHP
    }
    
    
}
