//
//  ViewController.swift
//  swapi
//
//  Created by Cambrian on 2022-09-20.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func printToConsole(_ sender: UIButton) {
        sender.isEnabled = false
        changeBool { response in
            print("button was pushed")
            DispatchQueue.main.async {
                sender.isEnabled = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

