//
//  aboutViewController.swift
//  renchuanliandong
//
//  Created by qiuhong on 1/8/16.
//  Copyright © 2016 qiuhhong. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    let version = "1.0.0"
    let content = "1.xxxx\n2.xxxx"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1) //0x4A90E2
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = "关于"
        self.navigationItem.titleView = titleLabel
        
        
        phoneNumberLabel.userInteractionEnabled = true
        
        iconImageView.layer.cornerRadius = 20
        iconImageView.layer.masksToBounds = true
        versionLabel.text = "系统版本:" + version
        contentLabel.text = "更新内容:\n" + content
        // Do any additional setup after loading the view.
        
        //SWRevealView
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "reveal-icon"), style: .Plain, target: self.revealViewController() , action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makeCall(sender: AnyObject) {
        let okHandler = {(action:UIAlertAction!) -> Void in
            let url = NSURL(string: "tel://10000")
            UIApplication.sharedApplication().openURL(url!)
        }
        alertView("400-003-4343", message: nil, okActionTitle: "拨打", cancleActionTitle: "取消", okHandler: okHandler, viewController: self)
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
