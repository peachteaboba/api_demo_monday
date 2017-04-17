//
//  ViewController.swift
//  api_demo_1
//
//  Created by Andy Feng on 4/17/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeAPICall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func makeAPICall() {
        
        // specify the url that we will be sending the GET Request to
        let url = URL(string: "http://swapi.co/api/people/")
        
        
        
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        
        
        
        // create a "data task" to make the request and run the completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    print(jsonResult)
                    
                    if let peepsArr = jsonResult["results"]{
//                        print(peepsArr)
                        
                        if let pArr = peepsArr as? NSArray{
                            
                            for p in pArr {
                                
                                if let pDict = p as? NSDictionary {
                                    
                                    print(pDict["name"]!)
                                }
                                
                                
                            }
                            
                        }
                        
                      
                        
                        
                    }
                    
                    
                    
                    
                }
            } catch {
                print(error)
            }
            
        })
        
        
        
        
        // execute the task and wait for the response before
        // running the completion handler. This is async!
        task.resume()
        
        
    }
    
    
    
    
}

