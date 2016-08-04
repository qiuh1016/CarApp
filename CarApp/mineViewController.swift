//
//  mineViewController.swift
//  HaoShiMap
//
//  Created by qiuhong on 4/14/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class mineViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1) //0x4A90E2
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = "我的"
        self.navigationItem.titleView = titleLabel
        
        tableView.tableFooterView = UIView()
        
        //SWRevealView
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "reveal-icon"), style: .Plain, target: self.revealViewController() , action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

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

extension mineViewController: UITableViewDataSource {
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("favorCell") as! favorCell
        
        switch indexPath.row {
        case 0:
            cell.cellImage.image = UIImage(named: "scrollImage_1")
            cell.titleLabel.text = "古琴"
            cell.addressLabel.text = "古代文人的音乐哲学"
        case 1:
            cell.cellImage.image = UIImage(named: "scrollImage_3")
            cell.titleLabel.text = "故宫"
            cell.addressLabel.text = "故宫新雕塑馆，就在“嬛嬛家”隔壁"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
}

extension mineViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
