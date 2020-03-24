//
//  celciusToFar.swift
//  the weather
//
//  Created by Isis Decrem on 3/24/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit

class celciusToFar: UIViewController {
    
    @IBOutlet weak var userEnteredTemp: UITextField!
    @IBOutlet weak var displayTheConversion: UILabel!

  
    
    @IBAction func Pressed(_ sender: Any) {
        if let temperature = userEnteredTemp.text {
              let temp = Double(temperature) ?? 0
              var part = String ((temp * 1.8) + 32)
              displayTheConversion.text = part + "°F"
              } else{
                  displayTheConversion.text = "invalid number"
              }
    }
    
}
