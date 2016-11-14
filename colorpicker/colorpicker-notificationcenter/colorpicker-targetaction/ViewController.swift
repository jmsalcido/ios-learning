//
//  ViewController.swift
//  colorpicker-targetaction
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openColorPickerButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let colorPickerVC = storyboard.instantiateViewController(withIdentifier: "ColorPicker") as! ColorPickerViewController
        colorPickerVC.initialColor = view.backgroundColor
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: colorPickerVC.ColorPickerNotification), object: nil, queue: OperationQueue.main, using: {(notification: Notification!) -> Void in
            let userInfo = notification?.userInfo
            let selectedColor = userInfo?[colorPickerVC.ColorPickerSelectedColorKey] as? UIColor
            self.didPickColor(color: selectedColor)
        })
        
        present(colorPickerVC, animated: true, completion: nil)
    }
    
    func didPickColor(color: UIColor?) {
        if let selectedColor = color {
            view.backgroundColor = selectedColor
        }
        dismiss(animated: true, completion: nil)
    }
}

