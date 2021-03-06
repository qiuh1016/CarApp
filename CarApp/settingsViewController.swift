//
//  userViewController.swift
//  renchuanliandong
//
//  Created by qiuhong on 1/5/16.
//  Copyright © 2016 qiuhhong. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var checkCurrectGesturePassword = true
    var gestruePasswordLabelText: String!
    var shipNum: String = {
        if let shipNum = NSUserDefaults.standardUserDefaults().valueForKey("shipNumber"){
            return shipNum as! String
        }
        return ""
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0x4A90E2, alpha: 1) //  0xFF6A6A
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = "设置"
        self.navigationItem.titleView = titleLabel
        
        if let _ = NSUserDefaults.standardUserDefaults().valueForKey("gesturePasswordFor\(shipNum)"){
            gestruePasswordLabelText = "修改/删除手势密码"
        }else{
            gestruePasswordLabelText =  "增加手势密码"
        }
        
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
    
    func logout() {
        let okHandler = {(action:UIAlertAction!) -> Void in
            self.logoutWithoutAlert()
        }
        alertView("提示", message: "即将退出系统，是否继续?", okActionTitle: "退出", cancleActionTitle: "取消", okHandler: okHandler, viewController: self)
        
        
    }
    
    func logoutWithoutAlert(){
        let hudView = HudView.hudInView(self.view, animated: false)
        hudView.text = "退出中"
        
        afterDelay(1.0){
            hudView.hideAnimated(self.view, animated: false)
            
            let okView = OKView.hudInView(self.view, animated: false)
            okView.text = "已退出"
            afterDelay(0.5){
                okView.hideAnimated(self.view, animated: false)
                //self.dismissViewControllerAnimated(true, completion: nil)
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: "hasLogin")
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: "gestureHasLogin")
                self.navigationController?.popToRootViewControllerAnimated(false)
            }
        }
    }
    
//    func changeLoginPassword(){
//        let alert = UIAlertController(title: "修改密码", message: "请输入原密码", preferredStyle: UIAlertControllerStyle.Alert)
//        let okHandler = {(action:UIAlertAction!) -> Void in
//            let textField = alert.textFields?.first
//            let PSW = NSUserDefaults.standardUserDefaults().valueForKey("password") as! String
//            
//            var PSWEnterB64 = ""
//            if let pswEnter = textField?.text {
//                PSWEnterB64 = "\(b64_md5("\(pswEnter)"))"
//            }
//            
//            if PSWEnterB64 == PSW {
//                self.performSegueWithIdentifier("changePasswordSegue", sender: nil)
//                
//            }else{
//                alertView("提示", message: "密码错误!", okActionTitle: "好的", okHandler: nil, viewController: self)
//            }
//        }
//        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: okHandler)
//        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
//        alert.addTextFieldWithConfigurationHandler{ (textField) in
//            textField.placeholder = "原密码"
//            textField.secureTextEntry = true
//            textField.addTarget(self, action: #selector(userViewController.textChanged(_:)), forControlEvents: .EditingChanged)
//        }
//        
//        alert.addAction(okAction)
//        alert.addAction(cancelAction)
//        alert.actions[0].enabled = false
//        presentViewController(alert, animated: true, completion: nil)
//    }
    
    func textChanged(sender: AnyObject){
        let textField = sender as! UITextField
        var resp: UIResponder! = textField
        while !(resp is UIAlertController){
            resp = resp.nextResponder()
        }
        let alert = resp as! UIAlertController
        alert.actions[0].enabled = (textField.text != "")
    }
    
    func changeGesturePassword(){
        performSegueWithIdentifier("changeGesturePasswordSegue", sender: nil)
    }
    
    func refreshStaffHistorySetting(swithController: UISwitch!){
        if swithController.on{
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "refreshStaffHistory")
        }else{
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "refreshStaffHistory")
        }
    }
    
    func showWalkthroughView(swithController: UISwitch!){
        var message: String!
        if swithController.on{
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "hasViewedWalkThrough")
            message = "将在下次登录前显示引导页!"
        }else{
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasViewedWalkThrough")
            message = "下次登录前不再显示引导页!"
        }
        alertView("引导页", message: message, okActionTitle: "好的", okHandler: nil, viewController: self)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "changeGesturePasswordSegue"{
//            let viewController = segue.destinationViewController as! unlockViewController
//            viewController.delegate = self
//            viewController.dontShowCancleButton = false
//            if let _ = NSUserDefaults.standardUserDefaults().valueForKey("gesturePasswordFor\(shipNum)"){
//                if checkCurrectGesturePassword{
//                    viewController.newPSWMode = false
//                    viewController.forgetGesturePasswordButtonHidden = false
//                    viewController.removeGesturePasswordButtonHidden = true
//                }else{
//                    viewController.newPSWMode = true
//                    viewController.forgetGesturePasswordButtonHidden = true
//                    viewController.removeGesturePasswordButtonHidden = false
//                }
//            }else{
//                viewController.newPSWMode = true
//                viewController.forgetGesturePasswordButtonHidden = true
//                viewController.removeGesturePasswordButtonHidden = true
//            }
//        }
    }
    
}

extension settingsViewController: UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let labelCell = tableView.dequeueReusableCellWithIdentifier("labelCell")!
        let labelCellLabel = labelCell.viewWithTag(1001) as! UILabel
        let logoutCell = tableView.dequeueReusableCellWithIdentifier("logoutCell")!
        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 0:
                //修改登录密码
                labelCellLabel.text = "修改登录密码"
                return labelCell
            case 1:
                //修改手势密码
                labelCellLabel.text = gestruePasswordLabelText
                return labelCell
            case 2:
                //更换车型
                labelCellLabel.text = "更换车型"
                return labelCell
//                let switchCell = tableView.dequeueReusableCellWithIdentifier("switchCell")!
//                let switchCellLabel = switchCell.viewWithTag(1001) as! UILabel
//                let switchCellSwitch = switchCell.viewWithTag(1002) as! UISwitch
//                let refreshStaffHistory = NSUserDefaults.standardUserDefaults().boolForKey("refreshStaffHistory")
//                switchCellSwitch.setOn(refreshStaffHistory, animated: false)
//                switchCellSwitch.addTarget(self, action: #selector(settingsViewController.refreshStaffHistorySetting(_:)), forControlEvents: UIControlEvents.ValueChanged)
//                switchCellLabel.text = "提示新的打卡记录"
//                return switchCell
            default:
                break
            }
        case 1:
            switch indexPath.row{
            case 0:
                //显示引导页
                let switchCell = tableView.dequeueReusableCellWithIdentifier("switchCell")!
                let switchCellLabel = switchCell.viewWithTag(1001) as! UILabel
                let switchCellSwitch = switchCell.viewWithTag(1002) as! UISwitch
                let hasViewedWalkThrough = NSUserDefaults.standardUserDefaults().boolForKey("hasViewedWalkThrough")
                switchCellSwitch.setOn(!hasViewedWalkThrough, animated: false)
                switchCellSwitch.addTarget(self, action: #selector(settingsViewController.showWalkthroughView(_:)), forControlEvents: UIControlEvents.ValueChanged)
                switchCellLabel.text = "显示引导页"
                return switchCell
            case 1:
                //清楚数据
                labelCellLabel.text = "清除所有数据"
                return labelCell
            
            default:
                break
            }
        case 2:
            return logoutCell
        default:
            break
        }
        
        labelCellLabel.text = "出现错误"
        return labelCell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "系统设置"
        case 1:
            return "其他设置"
        default:
            break
        }
        return nil
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if screenH == 480{
            if section == 2{
                return 20
            }
            return 30
        }
        return 40
    }
        
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section{
        case 0:
            return 0
        case 1:
            return 0
        default:
            break
        }
        return 0
    }
    
    
}

extension settingsViewController: UITableViewDelegate{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 0:
                //修改登录密码
                //changeLoginPassword()
                break
            case 1:
                //手势密码
                //changeGesturePassword()
                break
            case 2:
                //更换车型
                let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let brandSelectViewController = storyboard.instantiateViewControllerWithIdentifier("brandSelectViewController")
                self.presentViewController(brandSelectViewController, animated: true, completion: nil)
            default:
                break
            }
        case 1:
            switch indexPath.row{
            case 0:
                print("引导页")
            case 1:
                //清除所有数据
                let okHandler = {(action:UIAlertAction!) -> Void in
                    let appDomain = NSBundle.mainBundle().bundleIdentifier
                    if let appDomain = appDomain{
                        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
                        self.logoutWithoutAlert()
                        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "clearedUserData")
                    }else{
                        alertView("提示", message: "清除数据出错!", okActionTitle: "好的", okHandler: nil, viewController: self)
                    }
                }
                alertView("是否继续?", message: "即将清空数据并退出登录", okActionTitle: "继续", cancleActionTitle: "取消", okHandler: okHandler, viewController: self)
            default:
                break
            }
            
        case 2:
            //logout
            logout()
        default:
            break
        }
        
    }
    
}
//
//extension userViewController: unlockViewDelegate{
//    
//    func dismissView(controller: unlockViewController) {
//        dismissViewControllerAnimated(true, completion: nil)
//        checkCurrectGesturePassword = true
//        if let _ = NSUserDefaults.standardUserDefaults().valueForKey("gesturePasswordFor\(shipNum)"){
//            gestruePasswordLabelText = "修改/删除手势密码"
//        }else{
//            gestruePasswordLabelText = "增加手势密码"
//        }
//        tableView.reloadData()
//    }
//    
//    func gesturePasswordCorrect(controller: unlockViewController) {
//        if checkCurrectGesturePassword{
//            checkCurrectGesturePassword = false
//            dismissViewControllerAnimated(false, completion: nil)
//            performSegueWithIdentifier("changeGesturePasswordSegue", sender: nil)
//        }else{
//            checkCurrectGesturePassword = true
//            dismissViewControllerAnimated(true, completion: nil)
//        }
//    }
//    
//}