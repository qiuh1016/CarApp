//
//  detailViewController.swift
//  HaoShiMap
//
//  Created by qiuhong on 4/18/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import pop
import Shimmer

class detailViewController: UIViewController {

    
    var titleText = "店家资讯"
    var titleLabelText = "米粉汤大娘"
    var detailText = "据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。"
    var storyText = "据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。据中国地震局消息，4月19日1时10分在北京房山区(塌陷)(北纬39.9度、东经115.8度)发生2.7级地震，震源深度0公里。"
    
    var scrollView      = UIScrollView()
    var titleLabel      = UILabel()
    var headImageView   = UIImageView()
    
    var likeButton      = UIButton()
    var shareButton     = UIButton()
    var mapButton       = UIButton()
    
    var detailHeadLabel = UILabel()
    var detailLabel     = UILabel()
    var storyHeadLabel  = UILabel()
    var storyLabel      = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1) //0x4A90E2
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = titleText
        self.navigationItem.titleView = titleLabel
        
        //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
        setView()
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func setView() {
        scrollView = UIScrollView(frame: self.view.frame)
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.view.addSubview(scrollView)
        
        //titleLabel
        titleLabel = UILabel(frame: CGRectMake(10, 10, screenW - 20, 21))
        titleLabel.text = titleLabelText
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        titleLabel.textColor = UIColor.blackColor()
        scrollView.addSubview(titleLabel)
        
        //head Image
        headImageView = UIImageView(frame: CGRectMake(0, titleLabel.frame.maxY + 10, screenW, 200))
        headImageView.image = UIImage(named: "scrollImage_3")
        scrollView.addSubview(headImageView)
        
        //three button
        //likeButton = UIButton(frame: CGRectMake(0, headImageView.frame.maxY + 10, (screenW - 20) / 3, 44))
        
        likeButton = UIButton(type: .Custom)
        shareButton = UIButton(type: .Custom)
        mapButton = UIButton(type: .Custom)
        likeButton.frame = CGRectMake(0, headImageView.frame.maxY + 10, (screenW - 20) / 3, 44)
        shareButton.frame = CGRectMake(likeButton.frame.maxX + 10, headImageView.frame.maxY + 10, (screenW - 20) / 3, 44)
        mapButton.frame = CGRectMake(shareButton.frame.maxX + 10, headImageView.frame.maxY + 10, (screenW - 20) / 3, 44)
        
        likeButton.backgroundColor = UIColor.lightGrayColor()
        shareButton.backgroundColor = UIColor.lightGrayColor()
        mapButton.backgroundColor = UIColor.lightGrayColor()
        
        likeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        shareButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        mapButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        likeButton.tag = 1000
        shareButton.tag = 1001
        mapButton.tag = 1002
        
        likeButton.addTarget(self, action: #selector(detailViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        shareButton.addTarget(self, action: #selector(detailViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        mapButton.addTarget(self, action: #selector(detailViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        
        likeButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        shareButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        mapButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        
        likeButton.setTitle("喜欢", forState: .Normal)
        shareButton.setTitle("分享", forState: .Normal)
        mapButton.setTitle("地图", forState: .Normal)
        
        scrollView.addSubview(likeButton)
        scrollView.addSubview(shareButton)
        scrollView.addSubview(mapButton)
        
        //detail and story label
        detailHeadLabel = UILabel(frame: CGRectMake(5, likeButton.frame.maxY + 10, screenW - 10, 21))
        detailHeadLabel.text = "详细资料"
        detailHeadLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        detailHeadLabel.textColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1)
        scrollView.addSubview(detailHeadLabel)
        
        let detailTextSize = detailText.boundingRectWithSize(CGSizeMake(screenW - 10, CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 13)!], context: nil).size
        detailLabel = UILabel(frame: CGRectMake(5, detailHeadLabel.frame.maxY, screenW - 10, detailTextSize.height))
        detailLabel.textColor = UIColor.blackColor()
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = .ByWordWrapping
        detailLabel.text = detailText
        detailLabel.font = UIFont(name: "HelveticaNeue", size: 13)
        scrollView.addSubview(detailLabel)
        
        storyHeadLabel = UILabel(frame: CGRectMake(5, detailLabel.frame.maxY + 10, screenW - 10, 21))
        storyHeadLabel.text = "摊贩故事"
        storyHeadLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        storyHeadLabel.textColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1)
        scrollView.addSubview(storyHeadLabel)
        
        let storyTextSize = storyText.boundingRectWithSize(CGSizeMake(screenW - 10, CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 13)!], context: nil).size
        storyLabel = UILabel(frame: CGRectMake(5, storyHeadLabel.frame.maxY, screenW - 10, storyTextSize.height))
        storyLabel.textColor = UIColor.blackColor()
        storyLabel.numberOfLines = 0
        storyLabel.lineBreakMode = .ByWordWrapping
        storyLabel.text = storyText
        storyLabel.font = UIFont(name: "HelveticaNeue", size: 13)
        scrollView.addSubview(storyLabel)
        
        scrollView.contentSize = CGSizeMake(screenW, storyLabel.frame.maxY + 20)
        
    }
    
    var isLiked = false
    
    func buttonTapped(sender: UIButton) {
        switch sender.tag {
        case 1000:
            isLiked = !isLiked
            likeButton.backgroundColor = isLiked ? UIColor.colorFromRGB(0xFF6A6A, alpha: 1) : UIColor.lightGrayColor()
            
        case 1001:
            print("share")
        case 1002:
            print("map")
        default:
            break
        }
    }
    
    
}
