//
//  UserViewController.swift
//  YALLayoutTransitioning
//
//  Created by Roman on 23.02.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit
import DisplaySwitcher

private let animationDuration: NSTimeInterval = 0.3

private let listLayoutStaticCellHeight: CGFloat = 80
private let gridLayoutStaticCellHeight: CGFloat = 165

class UserViewController: UIViewController{
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var rotationButton: RotationButton!
    
    private var users = UserDataProvider().generateFakeUsers()
    private var searchUsers = [User]()
    private var isTransitionAvailable = true
    private lazy var listLayout = BaseLayout(staticCellHeight: listLayoutStaticCellHeight, nextLayoutStaticCellHeight: gridLayoutStaticCellHeight, layoutState: .ListLayoutState)
    private lazy var gridLayout = BaseLayout(staticCellHeight: gridLayoutStaticCellHeight, nextLayoutStaticCellHeight: listLayoutStaticCellHeight, layoutState: .GridLayoutState)
    private var layoutState: CollectionViewLayoutState = .ListLayoutState
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchUsers = users
        rotationButton.selected = true
        setupCollectionView()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0xFF6A6A, alpha: 1) //0x4A90E2
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let titleLabel = UILabel(frame: CGRectMake(0, 0, 100, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.text = "我的"
        self.navigationItem.titleView = titleLabel
        
        //SWRevealView
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "reveal-icon"), style: .Plain, target: self.revealViewController() , action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
    // MARK: - Private methods
    private func setupCollectionView() {
        collectionView.collectionViewLayout = listLayout
        collectionView.registerNib(UserCollectionViewCell.cellNib, forCellWithReuseIdentifier:UserCollectionViewCell.id)
    }
    
    // MARK: - Actions
    @IBAction func buttonTapped(sender: AnyObject) {
        if !isTransitionAvailable {
            return
        }
        let transitionManager: TransitionManager
        if layoutState == .ListLayoutState {
            layoutState = .GridLayoutState
            transitionManager = TransitionManager(duration: animationDuration, collectionView: collectionView!, destinationLayout: gridLayout, layoutState: layoutState)
        } else {
            layoutState = .ListLayoutState
            transitionManager = TransitionManager(duration: animationDuration, collectionView: collectionView!, destinationLayout: listLayout, layoutState: layoutState)
        }
        transitionManager.startInteractiveTransition()
        rotationButton.selected = layoutState == .ListLayoutState
        rotationButton.animationDuration = animationDuration
    }
    
}

extension UserViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchUsers.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(UserCollectionViewCell.id, forIndexPath: indexPath) as! UserCollectionViewCell
        if layoutState == .GridLayoutState {
            cell.setupGridLayoutConstraints(1, cellWidth: cell.frame.width)
        } else {
            cell.setupListLayoutConstraints(1, cellWidth: cell.frame.width)
        }
        cell.bind(searchUsers[indexPath.row])
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        let vc = storyboard.instantiateViewControllerWithIdentifier("detailViewController") as! detailViewController
        vc.titleLabelText = searchUsers[indexPath.row].name + " " + searchUsers[indexPath.row].surname
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
        return customTransitionLayout
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        isTransitionAvailable = false
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isTransitionAvailable = true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
}

extension UserViewController: UISearchBarDelegate {
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchUsers = users
        } else {
            searchUsers = searchUsers.filter { return $0.name.containsString(searchText) }
        }
      
        collectionView.reloadData()
    }
    
    
    
}
    
