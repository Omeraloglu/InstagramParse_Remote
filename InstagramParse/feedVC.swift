//
//  FirstViewController.swift
//  InstagramParse
//
//  Created by Ömer ALOĞLU on 20.06.2022.
//

import UIKit
import Parse

class feedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postOwnerArray = [String]()
    var postCommentArray = [String]()
    var postUUIDArray = [String]()
    var postImageArray = [PFFileObject]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData(){
        let query = PFQuery(className: "Post")
        query.findObjectsInBackground { objects, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                if objects!.count > 0 {
                    for object in objects!{
                        self.postOwnerArray.append(object.object(forKey: "postowner") as! String)
                        self.postCommentArray.append(object.object(forKey: "postcomment") as! String)
                        self.postUUIDArray.append(object.object(forKey: "postuuid") as! String)
                        self.postImageArray.append(object.object(forKey: "postimage") as! PFFileObject)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postOwnerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedCell
        
        cell.userNameLabel.text = postOwnerArray[indexPath.row]
        cell.postCommentTExt.text = postCommentArray[indexPath.row]
        cell.postUUIDLabel.text = postUUIDArray[indexPath.row]
        
        postImageArray[indexPath.row].getDataInBackground { data, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                cell.postImage.image = UIImage(data: data!)
                
            }
        }
        
        return cell
        
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
