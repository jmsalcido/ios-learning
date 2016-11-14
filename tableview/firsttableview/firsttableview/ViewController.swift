//
//  ViewController.swift
//  firsttableview
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    let CellIdentifier = "org.otfusion.StateTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as! StateTableViewCell
        let cityState = data[indexPath.row].components(separatedBy: ", ")
        cell.nameLabel.text = cityState.first
        cell.bigLabel.text = cityState.last
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


}

