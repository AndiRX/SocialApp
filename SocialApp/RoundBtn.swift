//
//  RoundBtn.swift
//  SocialApp
//
//  Created by Petr on 17.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        
    }
}
