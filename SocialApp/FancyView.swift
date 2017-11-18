//
//  FancyView.swift
//  SocialApp
//
//  Created by Petr on 17.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

@IBDesignable
class FancyView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.9
        layer.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
        
        
    }
    
}
