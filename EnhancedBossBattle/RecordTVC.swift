//
//  RecordTVC.swift
//  EnhancedBossBattle
//
//  Created by ABA Lab on 11/6/17.
//  Copyright © 2017 ABA Lab. All rights reserved.
//

import UIKit

class RecordTVC: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var battles : [Battle] = [] //placeholder for battles sent to user
    var record : [Battle] = []  //placeholder for record checked for battles
    var battle = Battle()       //placeholder for individual battle selection 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData() //fetch data
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: react to user selecting row
        //I want the detail view controller to update based on the row that I selected
        
        //TODO: get cell information
        let selectedRow = indexPath.row     //remembers which row the user selected
        battle = battles[indexPath.row]     //sets the battle
            
            performSegue(withIdentifier: "recordShow", sender: self)    //perform segue
            
        
        
    }
    
    
    func fetchData() {      //fetch data
        
        do {
            
            battles = try context.fetch(Battle.fetchRequest())  //tries to get battles 
            record = battles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
        } catch {       //catch if battles unavailable 
            print("Couldn't Fetch Data")
        }
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return battles.count        //return num battles 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        cell.textLabel?.text = battles[indexPath.row].winner! + " Won" //says who won
        // Configure the cell...

        return cell
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
        let destVC = segue.destination as! ViewController //sets next view as ViewController
        destVC.battle = self.battle //sends the battle to the next view
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
