//
//  ViewController.swift
//  EnhancedBossBattle
//
//  Created by ABA Lab on 10/20/17.
//  Copyright © 2017 ABA Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var winnerHPLabel: UILabel!
    @IBOutlet weak var heroStartHP: UILabel!
    @IBOutlet weak var bossStartHP: UILabel!
    @IBOutlet weak var heroWeapon: UILabel!
    @IBOutlet weak var bossWeapon: UILabel!
    
    
    var battle = Battle() // Establishes battle in question
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = false
        // Do any additional setup after loading the view, typically from a nib.
        
        //Following lines update winner, winnner hp, plus boss and hero stats
        winnerLabel.text = battle.winner!
        winnerHPLabel.text = String(battle.winnerFinalHP)
        heroStartHP.text = String(battle.heroStartHP)
        bossStartHP.text = String(battle.bossStartHP)
        heroWeapon.text = battle.heroWeapon!
        bossWeapon.text = battle.bossWeapon!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

