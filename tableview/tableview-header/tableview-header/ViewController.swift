//
//  ViewController.swift
//  tableview-header
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data = [("Arizona", ["Phoenix"]),
                ("California", ["Los Angeles", "San Francisco", "San Jose", "San Diego"]),
                ("Florida", ["Miami", "Jacksonville"]),
                ("Illinois", ["Chicago"]),
                ("New York", ["Buffalo", "New York"]),
                ("Pennsylvania", ["Pittsburg", "Philadelphia"]),
                ("Texas", ["Houston", "San Antonio", "Dallas", "Austin", "Fort Worth"])]
    
    @IBOutlet weak var tableView: UITableView!
    
    let CellIdentifier = "org.otfusion.StateTableViewCell"
    let HeaderViewIdentifier = "TableViewHeaderView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        let citiesInSection = data[indexPath.section].1
        cell.textLabel?.text = citiesInSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderViewIdentifier)
        header?.textLabel?.text = data[section].0
        return header
    }

}

