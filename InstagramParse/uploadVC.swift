//
//  SecondViewController.swift
//  InstagramParse
//
//  Created by Ömer ALOĞLU on 20.06.2022.
//

import UIKit

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
