//
//  CircleImageView.swift
//  SocialApp
//
//  Created by Petr on 18.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width/2
        clipsToBounds = true
    }

}
