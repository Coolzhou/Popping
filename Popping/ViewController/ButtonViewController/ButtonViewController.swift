//
//  ButtonViewController.swift
//  Popping
//
//  Created by Apple on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton()
        
    }
    
    func setupButton() {
        
        let flatBtn:UIButton = FlatButton.init(frame: CGRect.zero)
        view.addSubview(flatBtn)
        flatBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 100, height: 44))
            make.center.equalToSuperview()
        }
        flatBtn.backgroundColor = UIColor.orange
        
    
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
