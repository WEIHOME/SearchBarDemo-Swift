//
//  ViewController.swift
//  SearchBarDemo
//
//  Created by Weihong Chen on 30/04/2015.
//  Copyright (c) 2015 Weihong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchControllerDelegate {

    @IBOutlet weak var uiSearchBar: UISearchBar!
    @IBOutlet weak var uiTableView: UITableView!
    
    var data = [String]()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSearchBar.delegate = self
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        //This is one important line for using custom cell in resultTableView. If donot have this line to set constrains, it will result in a problem (Unable to simultaneously satisfy constraints) so that the resulttableview shows blank
        self.searchDisplayController?.searchResultsTableView.rowHeight = self.uiTableView.rowHeight
        
        data.append("The number of this cell is 1")
        data.append("The number of this cell is 2")
        data.append("The number of this cell is 3")
        data.append("The number of this cell is 4")
        data.append("The number of this cell is 5")
        data.append("The number of this cell is 6")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredData.count
        } else {
            return self.data.count
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var showedText: String?
        
        //This line, using uiTableView outlet instead of using tableView. Because this tableView could be resultTableView or main TableView. The resultTableView donot reconize a prototype cell which I design in the storyboard. Thus I need to use uiTableView outlet to get prototype cell
        let cell: CustomTableViewCell = uiTableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            cell.nameLabel.text = filteredData[indexPath.row]
        } else {
            cell.nameLabel.text = data[indexPath.row]
        }
        
        return cell
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    func filterContentForSearchText(searchText: String){
        self.filteredData = self.data.filter({ (text: String) -> Bool in
            
            if text.lowercaseString.rangeOfString(searchText.lowercaseString) != nil{
                return true
            }else{
                return false
            }
        })
    }
}

