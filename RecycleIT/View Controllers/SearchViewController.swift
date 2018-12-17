//
//  SearchViewController.swift
//  RecycleIT
//
//  Created by Samuel Schmitt on 12/9/18.
//  Copyright © 2018 Samuel Schmitt. All rights reserved.
//

import UIKit
import CSV

class SearchViewController: UITableViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    var recycleItems = [RecycleItem]()
    var filteredItems = [RecycleItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSetup()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Recycling Items"
        //searchController.hidesNavigationBarDuringPresentation = false
        
        navigationItem.searchController = searchController
        
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let image = UIImage(named: "search")
        let scaledImage = image?.scaleImage(toSize: CGSize(width: 10, height: 10))
        tabBarItem = UITabBarItem(title: "Search", image: scaledImage, tag: 1)
    }
    
    
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredItems = recycleItems.filter({ (item: RecycleItem) -> Bool in
            return item.name.lowercased().contains(searchText.lowercased())
            
        })
        tableView.reloadData()
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsCell") as! UITableViewCell
        cell.textLabel?.text = filteredItems[indexPath.row].name
        cell.detailTextLabel?.text = filteredItems[indexPath.row].material
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailView" {
            if let destinationVC = segue.destination as? DetailViewController {
                let cell = sender as! UITableViewCell
                let indexPath = tableView.indexPath(for: cell)!
                let item = filteredItems[indexPath.row]
                let backButton = UIBarButtonItem()
                backButton.title = item.name
                navigationItem.backBarButtonItem = backButton
                destinationVC.item = item
            }
        }
    }
    
    

    func dataSetup(){
        let csvPath = Bundle.main.path(forResource: "data", ofType: "csv")
        let csvURL = URL(fileURLWithPath: csvPath!)
        let stream = InputStream(url: csvURL)!
        
        
        do {
            let csv = try CSVReader(stream: stream, hasHeaderRow: true)
            let decoder = CSVRowDecoder()
            while csv.next() !=  nil {
                let row = try decoder.decode(RecycleItem.self, from: csv)
                recycleItems.append(row)
            }
            
            
        } catch {
            print(error)
        }
    }
    
    
    
}
