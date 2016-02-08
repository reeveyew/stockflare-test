//
//  ViewController.swift
//  StockFlare
//
//  Created by Reeve Yew on 08/02/2016.
//  Copyright © 2016 Reeve Yew. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var searchActive : Bool = false
    var stockArray = [StockDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

    
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        
        Networking.searchForTicker(searchBar.text!) { (detail) -> Void in
            //add detail to stockArray
            self.stockArray = detail as [StockDetail]
            print(self.stockArray)
            //update Table
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stockCell") as! StockCell
        
        //replace the cell with output
        cell.label_Name.text = "Stock Name: \(stockArray[indexPath.row].name)"
        cell.label_Ticker.text = "Ticker: \(stockArray[indexPath.row].ticker)"
        cell.label_Price.text = "$ \(String(stockArray[indexPath.row].price))"
        
        return cell
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

