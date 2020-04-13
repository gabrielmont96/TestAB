//
//  ViewController.swift
//  TestAB
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 13/04/20.
//  Copyright © 2020 Gabriel Monteiro Camargo da Silva - GCM. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FirstViewController"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapped(_ sender: Any) {
        Analytics.logEvent("button", parameters: ["button": "tapped"])
    }
    
}
