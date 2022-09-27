//
//  ViewController.swift
//  swapi
//
//  Created by Cambrian on 2022-09-20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func printToConsole(_ sender: UIButton) {
        sender.isEnabled = false
//        changeBool { response in
//            print("button was pushed")
//            DispatchQueue.main.async {
//                sender.isEnabled = true
//            }
//        }
        
        print("pre task")
        Task {
            let _ = await changeBool()
            print("button was pushed")
            sender.isEnabled = true
        }
        
        print("post task")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = "Name..."
        // call the swapi function to get person and display data in screen
//        SWAPI_Helper.fetchDir { person in
////            print(person.name)
//            DispatchQueue.main.async {
//                self.nameLabel.text = person.name
//            }
//        }
    }


}

