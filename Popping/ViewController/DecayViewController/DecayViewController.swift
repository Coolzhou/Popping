//
//  DecayViewController.swift
//  Popping
//
//  Created by Apple on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import pop
class DecayViewController: UIViewController, POPAnimationDelegate{
    
    var dragView: UIControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDragView()
    }
    
    func addDragView() {
        
        dragView = UIControl.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        dragView?.layer.cornerRadius = 50
        dragView?.layer.masksToBounds = true
        dragView?.center = view.center
        dragView?.backgroundColor = UIColor.init(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1)
        dragView?.addTarget(self, action: #selector(touchDown(sender:)), for: UIControlEvents.touchUpInside)
        
        view.addSubview(dragView!)
        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(pan:)))
        dragView?.addGestureRecognizer(pan)
        
    }
    
    @objc func touchDown(sender:UIControl) {
        sender.layer.pop_removeAllAnimations()
    }
    
    @objc func handlePan(pan :UIPanGestureRecognizer){
        
        let translation = pan.translation(in: view)
        pan.view?.center = CGPoint.init(x: (pan.view?.center.x)!+translation.x, y: (pan.view?.center.y)! + translation.y)
        pan.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
        
        if pan.state == .ended {
            let velocity = pan.velocity(in: self.view)
            if let anim1 = POPDecayAnimation(propertyNamed: kPOPLayerPosition) {
                anim1.delegate = self
                anim1.velocity = NSValue.init(cgPoint: velocity)
                dragView?.layer.pop_add(anim1, forKey: "layerScaleSmallAnimation")
            }
        }
    }
    
    //POPAnimationDelegate
    func pop_animationDidApply(_ anim: POPAnimation!) {
        let anim = anim as! POPDecayAnimation
        let isDragViewOutsideOfSuperView = self.view.frame.contains((dragView?.frame)!)

        if isDragViewOutsideOfSuperView == false {

            if let anima = POPSpringAnimation(propertyNamed: kPOPLayerPosition){
                anima.velocity = anim.velocity
                anima.toValue =  NSValue.init(cgPoint: view.center)
                dragView?.layer.pop_add(anima, forKey: "layerPositionAnimation")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
