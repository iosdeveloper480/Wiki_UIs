//
//  WAButton.swift
//
//  Created by Waqas Ali on 12/26/15.
//  Copyright © 2015 Jamisofttech. All rights reserved.
//

import UIKit

class WAButton: UIButton {
    
    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    
    @IBInspectable var backgroundColors: UIColor = UIColor.clear {
        didSet {
            self.layer.backgroundColor = backgroundColors.cgColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
            if borderWidth != 0 {
                borderWidth = 1
            }
        }
    }
    
    func addTopBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func getWAViewBounds() -> CGRect {
        return self.bounds
    }
    
//    button.imageEdgeInsets = UIEdgeInsetsMake(0., button.frame.size.width - (image.size.width + 15.), 0., 0.);
//    button.titleEdgeInsets = UIEdgeInsetsMake(0., 0., 0., image.size.width);
    
    @IBInspectable var setImageRight: Bool = false {
        didSet {
            
            if let buttonImageView = self.imageView , setImageRight {
                imageEdgeInsets = UIEdgeInsetsMake(0, self.frame.size.width - (buttonImageView.image!.size.width + 10), 0, 0)
                titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, buttonImageView.image!.size.width + 20)
            }
            
        }
    }
    
// Func write at 6 Jan 2016 WA
    @IBInspectable var imageName: String = "" {
        didSet {
            let origImage = UIImage(named: imageName);
            self.contentMode = UIViewContentMode.center
            let tintedImage = origImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.setImage(tintedImage, for: UIControlState())
            
        }
    }

    @IBInspectable var setShadow: Bool = false {
        didSet {
            setShadow = true
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowOpacity = shadowOpacity
            }
        }
    }
    
    @IBInspectable var shadowOffsetWidth:CGFloat = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowOffset.width = shadowOffsetWidth
            }
        }
    }
    
    @IBInspectable var shadowOffsetHeight:CGFloat = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowOffset.height = shadowOffsetHeight
            }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            if setShadow {
                self.layer.shadowRadius = shadowRadius
            }
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            if setShadow {
                self.layer.shadowColor = shadowColor.cgColor
            }
        }
    }
 
    
    
}
