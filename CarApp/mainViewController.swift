//
//  ViewController.swift
//  HaoShiMap
//
//  Created by qiuhong on 4/14/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import SDCycleScrollView

private let cycleScrollViewHeight: CGFloat = screenW / 375 * 220
private let labelTextColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1)
private let labelSecondLineTextColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1)
private let labelBackgroundColor = UIColor.whiteColor()

class mainViewController: UIViewController {
    
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    var imageView4 = UIImageView()
    var imageView5 = UIImageView()
    
    var label1 = UILabel()
    var label2 = UILabel()
    var label3 = UILabel()
    var label4 = UILabel()
    var label5 = UILabel()
    var label6 = UILabel()
    
    var cycleScrollView: SDCycleScrollView!
    
    
    var imageGroup = ["scrollImage_1", "scrollImage_2", "scrollImage_3", "scrollImage_4"]
    var titleGroup = ["古琴——古代文人的音乐哲学", "湖洲寻湖笔", "故宫新雕塑馆，就在“嬛嬛家”隔壁", "龙虾届惊现双面娇娃"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1) //0x4A90E2
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = "好事地图"
        self.navigationItem.titleView = titleLabel
        
        //SWRevealView
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "reveal-icon"), style: .Plain, target: self.revealViewController() , action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        //SDcycleScrollView
        cycleScrollView = SDCycleScrollView(frame: CGRectMake(0, 64, self.view.bounds.size.width, cycleScrollViewHeight), imageNamesGroup: imageGroup)
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        cycleScrollView.titlesGroup = titleGroup
        cycleScrollView.autoScrollTimeInterval = 5.0
        cycleScrollView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(cycleScrollView)
        // 网络加载图片的轮播器
        //SDCycleScrollView *cycleScrollView = [cycleScrollViewWithFrame:frame delegate:delegate placeholderImage:placeholderImage];
        //cycleScrollView.imageURLStringsGroup = imagesURLStrings;
        
        //set Image and Label
        setView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "searchSegue" {
            let vc = segue.destinationViewController as! searchViewController
            vc.titleText = sender as! String
        } else if segue.identifier == "showDetailSegue" {
            
        }
    }
    
    func setView() {
        var imageGroup = ["main-zhushi", "main-xiaochi", "main-shuiguo", "main-qita", "main-zazhishe"]

        let viewSpace: CGFloat = 5.0
        let viewNumber = 6
        
        let imageViewHeight = (self.view.frame.height - cycleScrollViewHeight - 64.0) / CGFloat(viewNumber) - viewSpace
        let imageViewWidth: CGFloat = screenW / 375 * 240
        
        //image
        imageView1 = UIImageView(frame: CGRectMake(0, cycleScrollViewHeight + CGFloat(0) * (viewSpace + imageViewHeight) + viewSpace + 64.0, imageViewWidth, imageViewHeight))
        imageView1.image = UIImage(named: imageGroup[0])
        
        imageView2 = UIImageView(frame: CGRectMake(0, cycleScrollViewHeight + CGFloat(1) * (viewSpace + imageViewHeight) + viewSpace + 64.0, imageViewWidth, imageViewHeight))
        imageView2.image = UIImage(named: imageGroup[1])
        
        imageView3 = UIImageView(frame: CGRectMake(0, cycleScrollViewHeight + CGFloat(2) * (viewSpace + imageViewHeight) + viewSpace + 64.0, imageViewWidth, imageViewHeight))
        imageView3.image = UIImage(named: imageGroup[2])
        
        imageView4 = UIImageView(frame: CGRectMake(0, cycleScrollViewHeight + CGFloat(3) * (viewSpace + imageViewHeight) + viewSpace + 64.0, imageViewWidth, imageViewHeight))
        imageView4.image = UIImage(named: imageGroup[3])
        
        imageView5 = UIImageView(frame: CGRectMake(0, cycleScrollViewHeight + CGFloat(4) * (viewSpace + imageViewHeight) + viewSpace + 64.0, imageViewWidth, imageViewHeight))
        imageView5.image = UIImage(named: imageGroup[4])
        
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)
        self.view.addSubview(imageView4)
        self.view.addSubview(imageView5)
        
        //label
        label1 = UILabel(frame: CGRectMake(imageViewWidth, imageView1.frame.minY, self.view.frame.width - imageViewWidth, imageViewHeight))
        label1.textAlignment = .Center
        label1.textColor = labelTextColor
        label1.numberOfLines = 0
        label1.backgroundColor = labelBackgroundColor
        
        label2 = UILabel(frame: CGRectMake(imageViewWidth, imageView2.frame.minY, self.view.frame.width - imageViewWidth, imageViewHeight))
        label2.textAlignment = .Center
        label2.textColor = labelTextColor
        label2.numberOfLines = 0
        label2.backgroundColor = labelBackgroundColor
        
        label3 = UILabel(frame: CGRectMake(imageViewWidth, imageView3.frame.minY, self.view.frame.width - imageViewWidth, imageViewHeight))
        label3.textAlignment = .Center
        label3.textColor = labelTextColor
        label3.numberOfLines = 0
        label3.backgroundColor = labelBackgroundColor
        
        label4 = UILabel(frame: CGRectMake(imageViewWidth, imageView4.frame.minY, self.view.frame.width - imageViewWidth, imageViewHeight))
        label4.textAlignment = .Center
        label4.textColor = labelTextColor
        label4.numberOfLines = 0
        label4.backgroundColor = labelBackgroundColor
        
        label5 = UILabel(frame: CGRectMake(imageViewWidth, imageView5.frame.minY, self.view.frame.width - imageViewWidth, imageViewHeight))
        label5.textAlignment = .Center
        label5.textColor = labelTextColor
        label5.numberOfLines = 0
        label5.backgroundColor = labelBackgroundColor
        
        //label6
        label6 = UILabel(frame: CGRectMake(0, self.view.frame.height - imageViewHeight, self.view.frame.width, imageViewHeight))
        label6.textAlignment = .Center
        label6.textColor = labelTextColor
        label6.numberOfLines = 0
        label6.backgroundColor = labelBackgroundColor
        
        self.view.addSubview(label1)
        self.view.addSubview(label2)
        self.view.addSubview(label3)
        self.view.addSubview(label4)
        self.view.addSubview(label5)
        self.view.addSubview(label6)
        
        setLabelText()
        setLabelTap()
    }
    
    func setLabelText() {

        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.alignment = NSTextAlignment.Center
        paragraphStyle.lineBreakMode =  NSLineBreakMode.ByTruncatingTail
        
        var labelAttributedText: NSMutableAttributedString!
        labelAttributedText = NSMutableAttributedString.init(string: "主  食\nMAIN MEAL")
        labelAttributedText.setAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, labelAttributedText.length))
        labelAttributedText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!, NSForegroundColorAttributeName: labelSecondLineTextColor], range: NSMakeRange(4, labelAttributedText.length - 4))
        label1.attributedText = labelAttributedText
        
        labelAttributedText = NSMutableAttributedString.init(string: "小  吃\nSNACK")
        labelAttributedText.setAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, labelAttributedText.length))
        labelAttributedText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!, NSForegroundColorAttributeName: labelSecondLineTextColor], range: NSMakeRange(4, labelAttributedText.length - 4))
        label2.attributedText = labelAttributedText
        
        labelAttributedText = NSMutableAttributedString.init(string: "冰品/水果\nFROZEN/FRUIT")
        labelAttributedText.setAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, labelAttributedText.length))
        labelAttributedText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!, NSForegroundColorAttributeName: labelSecondLineTextColor], range: NSMakeRange(5, labelAttributedText.length - 5))
        label3.attributedText = labelAttributedText
        
        labelAttributedText = NSMutableAttributedString.init(string: "其  他\nOTHER")
        labelAttributedText.setAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, labelAttributedText.length))
        labelAttributedText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!, NSForegroundColorAttributeName: labelSecondLineTextColor], range: NSMakeRange(4, labelAttributedText.length - 4))
        label4.attributedText = labelAttributedText
        
        labelAttributedText = NSMutableAttributedString.init(string: "大事件\nTHE BIG ISSUE")
        labelAttributedText.setAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, labelAttributedText.length))
        labelAttributedText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!, NSForegroundColorAttributeName: labelSecondLineTextColor], range: NSMakeRange(3, labelAttributedText.length - 3))
        label5.attributedText = labelAttributedText
        
        labelAttributedText = NSMutableAttributedString.init(string: "综合搜索，找附近\nALL CATAGRIES NEAR BY")
        labelAttributedText.setAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!, NSParagraphStyleAttributeName: paragraphStyle], range: NSMakeRange(0, labelAttributedText.length))
        labelAttributedText.addAttributes([NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 12.0)!, NSForegroundColorAttributeName: labelSecondLineTextColor], range: NSMakeRange(8, labelAttributedText.length - 8))
        label6.attributedText = labelAttributedText
        
        
//        let button = UIButton(frame: CGRectMake(64, 64, 100, 100))
//        button.setTitle("123", forState: .Normal)
//        button.setAttributedTitle(centerText, forState: .Normal)
//        button.titleLabel?.numberOfLines = 0
//        button.titleLabel?.textColor = UIColor.redColor()
//        button.backgroundColor = UIColor.whiteColor()
//        self.view.addSubview(button)
//        
//        button.addTarget(self, action: "label1Tapped", forControlEvents: .TouchUpInside)
        
    }
    
    func setLabelTap() {
        label1.userInteractionEnabled = true
        label2.userInteractionEnabled = true
        label3.userInteractionEnabled = true
        label4.userInteractionEnabled = true
        label5.userInteractionEnabled = true
        label6.userInteractionEnabled = true
        
        var tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewController.label1Tapped))
        label1.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewController.label2Tapped))
        label2.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewController.label3Tapped))
        label3.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewController.label4Tapped))
        label4.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewController.label5Tapped))
        label5.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewController.label6Tapped))
        label6.addGestureRecognizer(tapRecognizer)
    }
    
    func label1Tapped() {
        performSegueWithIdentifier("searchSegue", sender: "主食")
    }
    
    func label2Tapped() {
        performSegueWithIdentifier("searchSegue", sender: "小吃")
    }
    
    func label3Tapped() {
        performSegueWithIdentifier("searchSegue", sender: "冰品／水果")
    }
    
    func label4Tapped() {
        performSegueWithIdentifier("searchSegue", sender: "其他")
    }
    
    func label5Tapped() {
        performSegueWithIdentifier("searchSegue", sender: "大事件")
    }
    
    func label6Tapped() {
        performSegueWithIdentifier("searchSegue", sender: "综合搜索")
    }


}

extension mainViewController: SDCycleScrollViewDelegate {
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        let vc = storyboard.instantiateViewControllerWithIdentifier("detailViewController") as! detailViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        //performSegueWithIdentifier("showDetailSegue", sender: nil)
    }
}

