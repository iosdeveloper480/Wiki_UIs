//
//  WALabel.swift
//  BeOrganic
//
//  Created by Waqas Ali on 12/18/16.
//  Copyright Â© 2016 KLARENZ. All rights reserved.
//

import UIKit

@objc public enum AnimationType: Int {
    case LeftToRight
    case RightToLeft
    case Default
}

@IBDesignable class WALabel: UILabel {
    
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
    
    @IBInspectable var alphas: CGFloat = 0.0 {
        didSet {
            self.layer.opacity = Float(self.alphas)
        }
    }
    
    //Types of animations
    private var animType: AnimationType = .Default
    @IBInspectable var animationType: Int {
        get {
            return self.animType.rawValue
        }
        set (shapeIndex) {
            self.animType = AnimationType(rawValue: shapeIndex) ?? .Default
            self.showAnimation(animationType: AnimationType(rawValue: shapeIndex) ?? .Default)
        }
//        didSet {
//            if enableTransition {
//                self.animType = AnimationType(rawValue: self.animationType)!
//                self.showAnimation(animationType: self.animType)
//            }
//        }
    }
    
    @IBInspectable var enableTransition: Bool = false {
        didSet {
            if enableTransition {
//                self.showAnimation(animationType: self.animType)
//                self.pushTransition(1)
            }
        }
    }
    
    private func showAnimation(animationType animType: AnimationType) {
        switch animType {
            
        case .LeftToRight:
            self.fromLeftTransition(1)
            
        case .RightToLeft:
            self.fromRightTransition(0.5)
            
        default:
            self.pushTransition(1)
        }
    }
    
    func pushTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromRight
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionPush)
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFade)
    }
    
    func moveInTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionMoveIn
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionMoveIn)
    }
    
    func revealTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionReveal
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionReveal)
    }
    
    func fromRightTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFromRight
        animation.subtype = kCATransitionFromLeft
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionPush)
    }
    
    func fromLeftTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFromLeft
        animation.subtype = kCATransitionFromRight
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionPush)
    }
    
    func fromTopTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFromTop
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFromTop)
    }
    
    func fromBottomTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFromBottom
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFromBottom)
    }
//    #endif
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
