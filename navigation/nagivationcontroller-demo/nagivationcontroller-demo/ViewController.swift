//
//  ViewController.swift
//  nagivationcontroller-demo
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as UIViewController
        if segue.identifier == "redSegue" {
            destinationVC.title = "Red Bitch"
            destinationVC.view.backgroundColor = UIColor.red
        } else if segue.identifier == "blueSegue" {
            destinationVC.title = "Blue Girly"
            destinationVC.view.backgroundColor = UIColor.blue
        } else if segue.identifier == "greenSegue" {
            destinationVC.title = "Macho Green"
            destinationVC.view.backgroundColor = UIColor.green
        }
    }


}

