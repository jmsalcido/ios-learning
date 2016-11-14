//
//  ViewController.swift
//  colorpicker-delegate
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ColorPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func colorPicker(picker: ColorPickerViewController, didPickColor color: UIColor?) {
        if let selectedColor = color {
            view.backgroundColor = selectedColor
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openColorPicker(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let colorPickerVC = storyboard.instantiateViewController(withIdentifier: "ColorPicker") as! ColorPickerViewController
        colorPickerVC.delegate = self
        colorPickerVC.initialColor = view.backgroundColor
        present(colorPickerVC, animated: true, completion: nil)
    }


}

