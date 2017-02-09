//
//  EntryListTableViewController.swift
//  Day 3.2 journal
//
//  Created by Angela Montierth on 2/8/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedController.entries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryTitleCell", for: indexPath)
        
        let entry = EntryController.sharedController.entries[indexPath.row]
      
        cell.textLabel?.text = entry.title
        
        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //First delete data
            
            let entry = EntryController.sharedController.entries[indexPath.row]
            EntryController.sharedController.remove(entry: entry)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }    
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEntryDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let entryDetailVC = segue.destination as? EntryDetailViewController else { return }
                let entry = EntryController.sharedController.entries[indexPath.row]
            entryDetailVC.entry = entry
        }

    }

}
