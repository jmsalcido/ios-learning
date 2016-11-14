//
//  ColorPickerDelegate.swift
//  colorpicker-delegate
//
//  Created by Jose Miguel Salcido on 11/13/16.
//  Copyright © 2016 Jose Miguel Salcido. All rights reserved.
//

import UIKit

protocol ColorPickerDelegate: class {
    func colorPicker(picker: ColorPickerViewController, didPickColor color: UIColor?)
}
