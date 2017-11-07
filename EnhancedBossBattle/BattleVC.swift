//
//  BattleVC.swift
//  EnhancedBossBattle
//
//  Created by ABA Lab on 11/3/17.
//  Copyright © 2017 ABA Lab. All rights reserved.
//

import UIKit
import Foundation

protocol BattleDelegate {   //delegate for battle update
    func updateRecord(winner: String, heroInitHp: Int, bossInitHp: Int, winnerHP: Int, heroWeapon: String, bossWeapon: String)  //update method
}

class BattleVC: UIViewController {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext  // init context
    var battleDelegate : BattleDelegate? //init delegate
    
    //init battle stats
    var bossWeapon = String()
    var heroWeapon = String()
    var bossHP : Int = Int()
    var heroHP : Int = Int()
    let attack = 25
    var initHeroHP = Int()
    var initBossHP = Int()
    
    //init GUI 
    @IBOutlet weak var heroHealthBar: UIProgressView!
    @IBOutlet weak var bossHealthBar: UIProgressView!
    @IBOutlet weak var updateBox: UILabel!
    
    @IBAction func attButton(_ sender: AnyObject) {//if attack, defend, or reset
        let input = sender.currentTitle!!
        let heroStartHP = heroHP
        let bossStartHP = bossHP
        if input == "Attack" && bossHP > 0 && heroHP > 0 {//only run if the battle is ongoing and user hit attack 
            switch heroWeapon { //possible hero weapon scenarios according to rules of rock, paper, scissors, lizard, spock
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
        else if input == "Defend" && bossHP > 0 && heroHP > 0{  //only run if user hit defend and battle is ongoing 
            switch heroWeapon { //possible hero weapon scenarios in defensive scenarios, oposite the rules of rock, paper, scissors, lizard, spock
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
        else {      //user hit the reset button 
            heroHP = initHeroHP
            bossHP = initBossHP
        }
        
        if heroHP < 0 { //user cannot have negative HP 
            heroHP = 0
        }
        else if bossHP < 0 {    //boss cannot have negative HP 
            bossHP = 0
        }
        
        if heroHP == 0 || bossHP == 0 { //game is over, activate back button 
            print ("Game Over")
            let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
            self.navigationItem.leftBarButtonItem = newBackButton
        }
        
        bossHealthBar.progress = Float(bossHP)/Float(initBossHP)
        heroHealthBar.progress = Float(heroHP)/Float(initHeroHP)
        updateBox.text = "Hero lost: \(heroStartHP-heroHP) Hit Points,                         Boss lost: \(bossStartHP - bossHP) Hit Points "
    }
    
    @objc func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        let newBattle = Battle(context: context)    //saves the battle
        // Go back to the previous ViewController
        if heroHP < bossHP {    //sets winner and updates
            let winner = "Boss"
            
            newBattle.winner = winner
            newBattle.winnerFinalHP = Int16(bossHP)
            battleDelegate?.updateRecord(winner: winner, heroInitHp: initHeroHP, bossInitHp: initBossHP, winnerHP: bossHP, heroWeapon: heroWeapon, bossWeapon: bossWeapon)
        }
        else {
            let winner = "Hero"
            newBattle.winner = winner
            newBattle.winnerFinalHP = Int16(heroHP)
            battleDelegate?.updateRecord(winner: winner, heroInitHp: initHeroHP, bossInitHp: initBossHP, winnerHP: heroHP, heroWeapon: heroWeapon, bossWeapon: bossWeapon)
        }
        //sets battle record
        newBattle.bossStartHP = Int16(initBossHP)
        newBattle.bossWeapon = bossWeapon
        newBattle.heroStartHP = Int16(initHeroHP)
        newBattle.heroWeapon = heroWeapon
        (UIApplication.shared.delegate as! AppDelegate).saveContext()   //saves record
        
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        heroHealthBar.progress = 1
        bossHealthBar.progress = 1
        heroHealthBar.progressTintColor = UIColor.green //sets color to green
        bossHealthBar.progressTintColor = UIColor.green //sets color to green 
        
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
