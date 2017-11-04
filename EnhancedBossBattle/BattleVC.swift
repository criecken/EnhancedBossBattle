//
//  BattleVC.swift
//  EnhancedBossBattle
//
//  Created by ABA Lab on 11/3/17.
//  Copyright © 2017 ABA Lab. All rights reserved.
//

import UIKit
import Foundation

class BattleVC: UIViewController {
    var bossWeapon = String()
    var heroWeapon = String()
    var bossHP : Int = Int()
    var heroHP : Int = Int()
    let attack = 25
    
    @IBAction func attButton(_ sender: AnyObject) {
        let input = sender.currentTitle!!
        if input == "Attack" {
            switch heroWeapon {
            case "Rock of Justice":
                if bossWeapon == "Scissors of Darkness" || bossWeapon == "Lizard of Hatred"{
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
                else {
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
            case "Paper of Hope":
                if bossWeapon == "Rock of Inequity" || bossWeapon == "Spock of Deceit"{
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
                else {
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
            case "Scissors of Light":
                if bossWeapon == "Paper of Despair" || bossWeapon == "Lizard of Hatred"{
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
                else {
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
            case "Lizard of Love":
                if bossWeapon == "Paper of Despair" || bossWeapon == "Spock of Deceit"{
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
                else {
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
            case  "Spock of Truth":
                if bossWeapon == "Scissors of Darkness" || bossWeapon == "Rock of Inequity"{
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
                else {
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
            default:
                // this shouldn't happen
                heroHP = 0
            }        }
        else {
            switch heroWeapon {
            case "Rock of Justice":
                if bossWeapon == "Scissors of Darkness" || bossWeapon == "Lizard of Hatred"{
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
                else {
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
            case "Paper of Hope":
                if bossWeapon == "Rock of Inequity" || bossWeapon == "Spock of Deceit"{
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
                else {
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
            case "Scissors of Light":
                if bossWeapon == "Paper of Despair" || bossWeapon == "Lizard of Hatred"{
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
                else {
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
            case "Lizard of Love":
                if bossWeapon == "Paper of Despair" || bossWeapon == "Spock of Deceit"{
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
                else {
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
            case  "Spock of Truth":
                if bossWeapon == "Scissors of Darkness" || bossWeapon == "Rock of Inequity"{
                    bossHP = bossHP - attack + 15
                    heroHP = heroHP - attack - 15
                }
                else {
                    bossHP = bossHP - attack - 15
                    heroHP = heroHP - attack + 15
                }
            default:
                // this shouldn't happen
                heroHP = 0
            }
        }
        
        if heroHP < 0 {
            heroHP = 0
        }
        else if bossHP < 0 {
            bossHP = 0
        }
        
        if heroHP == 0 || bossHP == 0 {
            print ("Game Over")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
