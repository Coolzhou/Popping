//
//  CircleViewController.swift
//  Popping
//
//  Created by Apple on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController {
    
    var slider: UISlider!
    var circleView: CircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSliderView()
        addCircleView()
    }
    
    func addCircleView() {
        
        circleView = CircleView.init(frame: CGRect.init(x: (view.bounds.size.width-200)/2, y: 200, width: 200, height: 200))
        view.addSubview(circleView)
        circleView.animationToStrokeEnd(strokeEnd: slider.value, animation: false)
    }
    
    func addSliderView() {
        
        slider = UISlider.init(frame: CGRect.zero)
        view.addSubview(slider)
        slider.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-100)
            make.width.equalTo(view.frame.size.width - 30)
        }
        slider.value = 0.6
        slider.addTarget(self, action: #selector(sliderChangeValue(slider:)), for: UIControlEvents.valueChanged)
        
    }
      @objc func sliderChangeValue(slider:UISlider) {
    
        circleView.animationToStrokeEnd(strokeEnd: slider.value, animation: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
