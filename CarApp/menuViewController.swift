//
//  menuViewController.swift
//  HaoShiMap
//
//  Created by qiuhong on 4/14/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 150.0
private let kTableHeaderCutAway: CGFloat = 0.0

private let ringViewWidth: CGFloat = 2.0

class menuViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var portraitImageView: UIImageView!
    @IBOutlet weak var ringView: UIView!
    
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    
    //var ringView: UIView!
    
    @IBAction func portraitImageTapped(sender: AnyObject) {
        print("portraitImageTapped")
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .PhotoLibrary
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var image = info[UIImagePickerControllerOriginalImage] as! UIImage
        portraitImageView.image = image
        image = fixOrientation(image)
        let data = UIImagePNGRepresentation(image)
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: "portraitImage")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("portraitImage") {
            let image = UIImage(data: data as! NSData)
            portraitImageView.image = image //UIImage(CGImage: image!.CGImage!, scale: 1.0, orientation: UIImageOrientation.Right)
        }
        
        portraitImageView.layer.cornerRadius = portraitImageView.bounds.size.width / 2
        portraitImageView.layer.masksToBounds = true
        
        ringView.layer.cornerRadius = ringView.bounds.size.width / 2
        ringView.layer.masksToBounds = true
        
        portraitImageView.userInteractionEnabled = true
        
        tableView.separatorInset = UIEdgeInsetsZero
        
        
        //stretchy-header
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        //ringView
//        ringView = UIView(frame: CGRectMake(portraitImageView.frame.minX - ringViewWidth, portraitImageView.frame.minY - ringViewWidth ,portraitImageView.bounds.size.width + ringViewWidth * 2, portraitImageView.bounds.size.height + ringViewWidth * 2))
//        ringView.layer.cornerRadius = ringView.bounds.size.height / 2
//        ringView.layer.masksToBounds = true
//        ringView.layer.borderColor = UIColor.grayColor().CGColor
//        ringView.layer.borderWidth = ringViewWidth
//        headerView.addSubview(ringView)
        //headerView.bringSubviewToFront(portraitImageView)
        
        
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        
        headerView.layer.mask = headerMaskLayer
        updateHeaderView()
        
        tableView.tableFooterView = UIView()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateHeaderView()
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition({ (context) -> Void in
            [self]
            self.updateHeaderView()
            self.tableView.reloadData()
            }, completion: { (context) -> Void in
        })
    }
    
    func updateHeaderView() {
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
            //ringView.center.y = headerRect.size.height / 2 //ringView position setting
        }
        
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway))
        headerMaskLayer?.path = path.CGPath
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 3:
            performSegueWithIdentifier("guanyu", sender: nil)
        default:
            break
        }
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    
    
    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
