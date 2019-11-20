//
//  NotesTableViewController.swift
//  NotesAppClone
//
//  Created by Kadin Mesriani on 11/14/19.
//  Copyright © 2019 Kadin Mesriani. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    var notes:[Note] = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        
        let note1 = Note()
        
        note1.note = "Ice cream flavors to buy: Mint Chip, Cricket, Vanilla, Birthday Cake"
        notes.append(note1)
        
        let note2 = Note()
        note2.note = "Remember to buy dental treats for dog"
        notes.append(note2)
        
        let note3 = Note()
        note3.note = "Remember to study for the math test on Friday"
        notes.append(note3)
 
        */
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = "\(note.date) - " + notes[indexPath.row].note
        
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nt = segue.destination as! DetailViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let n = self.notes[indexPath.row]
            nt.note = n
        } else {
            let note = Note()
            notes.insert(note, at: 0)
            nt.note = note
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
