//
//  ColorPickerViewController.swift
//  colorpicker-delegate
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    weak var delegate: ColorPickerDelegate?
    
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    
    let colors = [("Cyan", UIColor.cyan), ("Magenta", UIColor.magenta), ("Yellow", UIColor.yellow)]
    var initialColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSegmentedControl.removeAllSegments()
        var selectedIndex = UISegmentedControlNoSegment
        for (index, color) in colors.enumerated() {
            if (color.1.isEqual(initialColor)) {
                selectedIndex = index
            }
            colorSegmentedControl.insertSegment(withTitle: color.0, at: index, animated: false)
        }
        colorSegmentedControl.selectedSegmentIndex = selectedIndex
    }
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorSegmentedControl.selectedSegmentIndex
        if selectedIndex != UISegmentedControlNoSegment {
            return colors[selectedIndex].1
        }
        return nil
    }
    
    @IBAction func doneButtonClick(_ sender: Any) {
        delegate?.colorPicker(picker: self, didPickColor: colorFromSelection())
    }
    

}
