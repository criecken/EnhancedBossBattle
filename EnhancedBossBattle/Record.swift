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
    let result : String
    let boss : Brawlers
    let hero : Brawlers
    
    
    init(result: String, boss: Brawlers, hero: Brawlers){
        self.result = result
        self.boss = boss
        self.hero = hero
        
    }
    
    
}
