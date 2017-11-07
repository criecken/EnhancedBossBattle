//
//  StartTVC.swift
//  EnhancedBossBattle
//
//  Created by ABA Lab on 11/3/17.
//  Copyright © 2017 ABA Lab. All rights reserved.
//

import UIKit

class StartTVC: UITableViewController, CharDelegate, BattleDelegate {
    var options = [String()]    //stores the options passed from the App Delegate
    var bossWeapon = String()   //stores boss Weapon
    var heroWeapon = String()   //stores hero Weapon
    var bossHP : Int = Int()    //stores boss hp
    var heroHP : Int = Int()    //stores hero hp
    var selectedRow = ""        //placeholder for row
    var delegate : CharDelegate?    //delegate for character update
    
    var battleDelegate : BattleDelegate?    //delegate for battle update
    var dest = ""                           //stores destination from Start
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext   //save context
    var record = [Battle]()                 //initialize previous record 
    
    func update(selectedRow: String, initHP: Int, weapon: String) {
        if selectedRow == "Hero"{
            let hero = Brawlers(initHP: initHP, finalHP: initHP, weapon: weapon)    //init hero
            heroWeapon = hero.weapon    //set hero weapon   
            heroHP = hero.initHP        //set hero hp
            print (hero.finalHP)        //check 
        }
        else if selectedRow == "Boss"{
            let boss = Brawlers(initHP: initHP, finalHP: initHP, weapon: weapon)    //init boss 
            bossWeapon = boss.weapon    //set boss weapon
            bossHP = boss.initHP        //set boss hp
        }
    }
    
    func updateRecord(winner: String, heroInitHp: Int, bossInitHp: Int, winnerHP: Int, heroWeapon: String, bossWeapon: String) {
     getData()                          //get data 
    }
    
    
    @IBAction func recordButton(_ sender: Any) {
        dest = "record"     //tell app to go to record view 
       // performSegue(withIdentifier: "recordSegue", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()       //get data
        let startButton = UIBarButtonItem(title: "Start", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.start(sender:)))  //create start button
        self.navigationItem.rightBarButtonItem = startButton    //init start button 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getData() {        // get data function 
        do {
            record = try context.fetch(Battle.fetchRequest()) //update record
        } catch {
            print("Fetching Failed")                        // check
        }
    }
    
    @objc func start(sender: UIBarButtonItem) {
         dest = "start"          //transition to battle vc 
        performSegue(withIdentifier: "startSelected", sender: self)
        // delegateUpdate?.update(newEmails: changedEmails, currentEmails: emails, updateRow: selectedRow)
    }
    
    func start(selectedRow: String, initHP: Int, weapon: String) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options.count        //return num options 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = options[indexPath.row] //sets label text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: react to user selecting row
        //I want the detail view controller to update based on the row that I selected
        
        print("In didSelectRowAt")      // check 
        //TODO: get cell information
        selectedRow = options[indexPath.row]    //hero or boss
        //call segue manually

         dest = "setup" //sets destination for setup tvc
         performSegue(withIdentifier: "cellSelected", sender: self) // perform segue
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
        
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if dest == "start" {    // passes battle parameters
            let destVC = segue.destination as! BattleVC
            destVC.bossHP = self.bossHP
            destVC.heroHP = self.heroHP
            destVC.bossWeapon = self.bossWeapon
            destVC.heroWeapon = self.heroWeapon
            destVC.initBossHP = self.bossHP
            destVC.initHeroHP = self.heroHP
            destVC.battleDelegate = self.battleDelegate
        }
        else if dest == "setup"{        // passes setup parameters
        let destVC = segue.destination as! SetupTVC
        destVC.selectedRow = selectedRow
        destVC.delegateUpdate = delegate
        switch selectedRow {
        case "Hero":
            destVC.options = ["Rock of Justice", "Paper of Hope", "Scissors of Light", "Lizard of Love", "Spock of Truth"]
        case "Boss":
            destVC.options = ["Rock of Inequity", "Paper of Despair", "Scissors of Darkness", "Lizard of Hatred", "Spock of Deceit"]
        default:
            destVC.options = ["No"]
        }
        }
        else{   //sets destination to record 
            let destVC = segue.destination as! RecordTVC
        }
        print("here")
        
    }
    
    

}
