//
//  ViewController.swift
//  InstagramParse
//
//  Created by Ömer ALOĞLU on 20.06.2022.
//

// New one

import UIKit

class signInVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
    }
    
}

