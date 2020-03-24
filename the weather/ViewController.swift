//
//  ViewController.swift
//  the weather
//
//  Created by Isis Decrem on 3/24/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var theCity: UITextField!
    @IBOutlet weak var theForecast: UILabel!
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + theCity.text!.replacingOccurrences(of: " ", with: "-") + "-1/forecasts/latest"){
            
             
            var message = " "
              let request = NSMutableURLRequest(url: url)
              let task = URLSession.shared.dataTask(with: request as URLRequest){
                  data, response, error in
                  if error != nil{
                      print(error)
                  }else{
                      if let unwrappedData = data{
                          let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                          var stringSeperator = "Weather Today</h2> (1&ndash;3 days)</div><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                          if let contentArray = dataString?.components(separatedBy: stringSeperator){
                              print(contentArray)
                              
                              if contentArray.count > 0{
                                  stringSeperator = "</span>"
                                  
                                let newContentArray = contentArray[1].components(separatedBy: stringSeperator)
                                      if newContentArray.count > 0{
                                          message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                          print(newContentArray[0])
                                      }
                                  
                              }
                          }
                          
                      }
                  }
                  if message == " "{
                      message = "The weather there could not be found, please try again."
                  }
                  
                  DispatchQueue.main.sync(execute: {
                      self.theForecast.text = message
                  })
                      
                  
              }
            task.resume() }  else {
                theForecast.text = "The weather there could not be found, please try again."
                
        }
            
              
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }


}

