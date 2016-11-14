//
//  ColorPickerViewController.swift
//  colorpicker-passingblock
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet weak var colorPickerSegmentedControl: UISegmentedControl!
    
    let colors = [("Cyan", UIColor.cyan), ("Magenta", UIColor.magenta), ("Yellow", UIColor.yellow)]
    var initialColor: UIColor?
    var doneHandler: ((UIColor?) -> Void)?
    
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
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorPickerSegmentedControl.selectedSegmentIndex
        if selectedIndex != UISegmentedControlNoSegment {
            return colors[selectedIndex].1
        }
        return nil
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        doneHandler?(colorFromSelection())
    }
}
