//
//  PostCell.swift
//  SocialApp
//
//  Created by Petr on 19.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {


    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var likesLbl: UIImageView!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
