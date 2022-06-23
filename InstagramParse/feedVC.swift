//
//  FirstViewController.swift
//  InstagramParse
//
//  Created by Ömer ALOĞLU on 20.06.2022.
//

import UIKit
import Parse

class feedVC: UIViewController {
    
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logOutClicked(_ sender: Any) {
        
        PFUser.logOutInBackground { error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                UserDefaults.standard.removeObject(forKey: "username")
                UserDefaults.standard.synchronize()
                
                let signIn = self.storyboard?.instantiateViewController(withIdentifier: "signIn") as! signInVC
                
                self.view.window?.rootViewController = signIn
                self.view.window?.makeKeyAndVisible()
                
                if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                    scene.rememberUser()
                }
                
            }
        }
        
    }
    
}
