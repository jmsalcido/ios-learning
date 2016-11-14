//
//  ColorPickerViewController.swift
//  colorpicker-targetaction
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet weak var colorPickerSegmentedControl: UISegmentedControl!
    
    let colors = [("Cyan", UIColor.cyan), ("Magenta", UIColor.magenta), ("Yellow", UIColor.yellow)]
    var initialColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerSegmentedControl.removeAllSegments()
        var selectedIndex = UISegmentedControlNoSegment
        for (index, color) in colors.enumerated() {
            if color.1.isEqual(initialColor) {
                selectedIndex = index
            }
            colorPickerSegmentedControl.insertSegment(withTitle: color.0, at: index, animated: false)
        }
        colorPickerSegmentedControl.selectedSegmentIndex = selectedIndex
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
    }
}
