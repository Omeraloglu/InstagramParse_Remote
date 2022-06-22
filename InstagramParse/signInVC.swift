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
        
//        let parseObject = PFObject(className: "Fruits")
//        parseObject["name"] = "Banana"
//        parseObject["calories"] = 150
//        parseObject.saveInBackground { success, error in
//            if error != nil{
//                print(error?.localizedDescription as Any)
//            }else{
//                print("saved")
//                }
//
//
//        }
//
        
//        let query = PFQuery(className: "Fruits")
//
//    //   query.whereKey("calories", greaterThan: 120)
//        query.whereKey("name", equalTo: "Apple")
//
//        query.findObjectsInBackground { objects, error in
//            if error != nil {
//                print(error?.localizedDescription as Any)
//            }else {
//                print(objects!)
//            }
//        }
    }
    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { user, error in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }else {
                    // remember user function
                    UserDefaults.standard.set(self.usernameText.text!, forKey: "username")
                    UserDefaults.standard.synchronize()

                    
                    if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                        scene.rememberUser()
                    }
                    
//                    let delegate : SceneDelegate = UIApplication.shared.delegate as! SceneDelegate
//                    delegate.rememberUser()
                  //  self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
            
        }else {
            let alert = UIAlertController(title: "Error", message: "username/password needed", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" {
        let user = PFUser()
        user.username = usernameText.text!
        user.password = passwordText.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    
                    // remember user function
                    UserDefaults.standard.set(self.usernameText.text!, forKey: "username")
                    UserDefaults.standard.synchronize()

                  //  let delegate : SceneDelegate = UIApplication.shared.delegate as! SceneDelegate
                    if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                        scene.rememberUser()
                    }
                  
               //     delegate.rememberUser()
                    
                  //  self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        
        }else {
            let alert = UIAlertController(title: "Error", message: "username/password needed", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
}

