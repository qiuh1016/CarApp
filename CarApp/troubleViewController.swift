//
//  troubleViewController.swift
//  CarApp
//
//  Created by qiuhong on 8/9/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class troubleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = "故障分析"
        self.navigationItem.titleView = titleLabel
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
