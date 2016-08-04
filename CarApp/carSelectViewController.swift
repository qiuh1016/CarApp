//
//  carSelectViewController.swift
//  CarApp
//
//  Created by qiuhong on 8/4/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class carSelectViewController: UITableViewController {
    
    let shangqidazhong = ["POLO", "桑塔纳", "朗逸", "凌渡", "帕萨特", "途观", "途安"]
    let yiqidazhong    = ["捷达", "宝来", "高尔夫", "速腾", "迈腾", "CC"]
    let jinkoudazhong  = ["甲壳虫", "辉腾", "Tiguan", "途锐", "夏朗", "尚酷", "迈特威", "凯路威"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return shangqidazhong.count
        case 1:
            return yiqidazhong.count
        case 2:
            return jinkoudazhong.count
        default:
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CarSelectCell", forIndexPath: indexPath)
        let textLabel = cell.viewWithTag(1001) as! UILabel
        let imageView = cell.viewWithTag(1000) as! UIImageView
        
        switch indexPath.section {
        case 0:
            textLabel.text = shangqidazhong[indexPath.row]
        case 1:
            textLabel.text = yiqidazhong[indexPath.row]
        case 2:
            textLabel.text = jinkoudazhong[indexPath.row]
        default:
            break
        }
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "上汽大众"
        case 1:
            return "一汽大众"
        case 2:
            return "进口大众"
        default:
            return ""
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
