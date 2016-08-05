//
//  searchViewController.swift
//  HaoShiMap
//
//  Created by qiuhong on 4/18/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {

    var titleText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0x4A90E2, alpha: 1) //  0xFF6A6A
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = titleText
        self.navigationItem.titleView = titleLabel
    }
    
}
