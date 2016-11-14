//
//  ColorPickerViewController.swift
//  colorpicker-targetaction
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    let ColorPickerNotification = "com.codepath.ColorPickerViewController.didPickColor"
    let ColorPickerSelectedColorKey = "com.codepath.ColorPickerViewController.selectedColor"
    
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
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorPickerSegmentedControl.selectedSegmentIndex
        if selectedIndex != UISegmentedControlNoSegment {
            return colors[selectedIndex].1
        }
        return nil
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        var selectionInfo: [NSObject : AnyObject] = [:]
        if let selectedColor = colorFromSelection() {
            selectionInfo[ColorPickerSelectedColorKey as NSString] = selectedColor
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ColorPickerNotification), object: self, userInfo: selectionInfo)
    }
}
