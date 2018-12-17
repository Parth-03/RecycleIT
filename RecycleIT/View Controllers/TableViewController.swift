//
//  TableViewController.swift
//  RecycleIT
//
//  Created by Samuel Schmitt on 12/16/18.
//  Copyright © 2018 Samuel Schmitt. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var items = [RecycleItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = items[0].material

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
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
	

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
		
		if segue.identifier == "ShowDetailView" {
			if let destinationVC = segue.destination as? DetailViewController {
				let cell = sender as! UITableViewCell
				let indexPath = tableView.indexPath(for: cell)!
				let item = items[indexPath.row]
				let backButton = UIBarButtonItem()
				backButton.title = item.name
				navigationItem.backBarButtonItem = backButton
				destinationVC.item = item
				
			}
			
		}
    }


}
