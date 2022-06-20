//
//  ViewController.swift
//  InstagramParse
//
//  Created by Ömer ALOĞLU on 20.06.2022.
//

// New one

import UIKit
import Parse

class signInVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "apple"
        parseObject["calories"] = 100
        parseObject.saveInBackground { success, error in
            if error != nil{
                print(error?.localizedDescription as Any)
            }else{
                print("saved")
                }
        
        
        }
    }
    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
    }
    
}

