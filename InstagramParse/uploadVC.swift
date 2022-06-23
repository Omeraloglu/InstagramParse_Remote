//
//  SecondViewController.swift
//  InstagramParse
//
//  Created by Ömer ALOĞLU on 20.06.2022.
//

import UIKit
import Parse

class uploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var postButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardRecognizere = UITapGestureRecognizer(target: self, action: #selector(uploadVC.hideKeyboard))
        self.view.addGestureRecognizer(keyboardRecognizere)
        // Do any additional setup after loading the view.
        
        
        postImage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uploadVC.choosePhoto))
        postImage.addGestureRecognizer(gestureRecognizer)
        
        postButton.isEnabled = false
    }

    @IBAction func postClicked(_ sender: Any) {
        postButton.isEnabled = false
        
        let object = PFObject(className: "Post")
        
        let data = postImage.image?.jpegData(compressionQuality: 0.5)
        let pfImage = PFFileObject(name: "image", data: data!)

        let uuid = UUID().uuidString
        let uuidpost = "\(uuid) \(PFUser.current()!.username!)"
        
        object["postimage"] = pfImage
        object["postcomment"] = commentText.text
        object["postowner"] = PFUser.current()!.username!
        object["postuuid"] = uuidpost
        

        object.saveInBackground { success, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                self.commentText.text = ""
                self.postImage.image = UIImage()
                self.tabBarController?.selectedIndex = 0
            }
        }
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
        
    }
    
    @objc func choosePhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        postImage.image = info[.originalImage] as? UIImage
        self.dismiss(animated:true, completion: nil)
        postButton.isEnabled = true
        
    }
    
}
