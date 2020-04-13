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
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var testLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FirstViewController"
        
        setupButtonAndLabel()
    }
    
    func setupButtonAndLabel() {
        if let buttonText = AppDelegate.remoteConfig["texto_botao"].stringValue {
            DispatchQueue.main.async {
                self.testButton.setTitle(buttonText, for: .normal)
            }
        }
        
        if let labelText = AppDelegate.remoteConfig["texto_label"].stringValue {
            DispatchQueue.main.async {
                self.testLabel.text = labelText
            }
        }
    }
    
    @IBAction func fetch(_ sender: Any) {
        Analytics.logEvent("fetchButton", parameters: ["fetchButton": "tapped"])
        AppDelegate().fetchRemoteConfig(finished: {
            self.setupButtonAndLabel()
        })
    }
    
    @IBAction func tapped(_ sender: Any) {
        Analytics.logEvent("testButton", parameters: ["testButton": "tapped"])
    }
    
}
