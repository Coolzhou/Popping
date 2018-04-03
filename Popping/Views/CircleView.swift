//
//  CircleView.swift
//  Popping
//
//  Created by Apple on 2018/4/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import pop

class CircleView: UIView {
    
    var circleLayer:CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.orange
        addCircleLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addCircleLayer() {
        let lineWidth:CGFloat = 4.0
        let path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.bounds.size.width/2).cgPath
        
        circleLayer = CAShapeLayer.init()
        circleLayer.path = path
        circleLayer.fillColor = nil
        circleLayer.strokeColor = UIColor.init(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1).cgColor
        circleLayer.lineWidth = lineWidth
        circleLayer.lineCap = kCALineCapRound
        circleLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(circleLayer)
    }
    
    func animationToStrokeEnd(strokeEnd:Float,animation:Bool){
        if animation {
            animationToStrokeEnd(strokeEnd: strokeEnd)
        }
        circleLayer.strokeEnd = CGFloat(strokeEnd)
    }
    
    func animationToStrokeEnd(strokeEnd:Float) {
        if let animation = POPSpringAnimation(propertyNamed: kPOPShapeLayerStrokeEnd){
            animation.toValue = NSNumber.init(value: strokeEnd)
            animation.springBounciness = 12.0
            animation.removedOnCompletion = false
            circleLayer.pop_add(animation, forKey: "layerStrokeAnimation")
        }
    }

}
