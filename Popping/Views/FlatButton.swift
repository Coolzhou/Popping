//
//  FlatButton.swift
//  Popping
//
//  Created by Apple on 2018/3/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class FlatButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addSomeTarget()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        backgroundColor = self.tintColor
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.systemFont(ofSize: 22)
        self.setTitleColor(UIColor.white, for: .normal)
        
    }
    
    func addSomeTarget() {
        
        addTarget(self, action: #selector(scaleToSmall), for: UIControlEvents.touchDown)
        addTarget(self, action: #selector(scaleAnimation), for: UIControlEvents.touchUpInside)
        addTarget(self, action: #selector(scaleToDefault), for: UIControlEvents.touchDragExit)
    }
    
    @objc func scaleToSmall() {
        
        let scaleSmall:POPBasicAnimation = POPBasicAnimation.pop_animation(forKey: kPOPLayerScaleXY) as! POPBasicAnimation
        scaleSmall.toValue = NSValue.init(cgSize: CGSize.init(width: 0.8, height: 0.8))
        layer.pop_add(scaleSmall, forKey: "layerScaleSmallAnimation")
        
    }
    
    @objc func scaleAnimation() {
        
        let scaleAnimation:POPSpringAnimation = POPSpringAnimation.pop_animation(forKey: kPOPLayerScaleXY) as! POPSpringAnimation
        scaleAnimation.velocity = NSValue.init(cgSize: CGSize.init(width: 3.0, height: 3.0))
        scaleAnimation.toValue = NSValue.init(cgSize: CGSize.init(width: 1.0, height: 1.0))
        scaleAnimation.springBounciness = 18.0
        layer.pop_add(scaleAnimation, forKey: "layerScaleAnimation")
        
        
    }
    
    @objc func scaleToDefault() {
        let scaleSmall:POPBasicAnimation = POPBasicAnimation.pop_animation(forKey: kPOPLayerScaleXY) as! POPBasicAnimation
        scaleSmall.toValue = NSValue.init(cgSize: CGSize.init(width: 1.0, height: 1.0))
        layer.pop_add(scaleSmall, forKey: "layerScaleSmallAnimation")
    }

}
