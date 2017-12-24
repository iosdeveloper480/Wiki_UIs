//
//  WALabel.swift
//
//  Created by Waqas Ali on 1/5/17.
//  Copyright © 2017 Jamisofttech. All rights reserved.
//

import UIKit

@IBDesignable class WALabel: UILabel {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
}
