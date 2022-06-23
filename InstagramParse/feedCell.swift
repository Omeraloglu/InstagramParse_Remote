//
//  feedCell.swift
//  InstagramParse
//
//  Created by Ömer ALOĞLU on 23.06.2022.
//

import UIKit

class feedCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postUUIDLabel: UILabel!
    @IBOutlet weak var postCommentTExt: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        postUUIDLabel.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func likeClicked(_ sender: Any) {
    }
    
    @IBAction func commentClicked(_ sender: Any) {
    }
    
}
