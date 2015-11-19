//
//  SecondViewController.swift
//  CollectionContainerViewController
//
//  Created by Kevin Goedecke on 11/18/15.
//  Copyright © 2015 kevingoedecke. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionCell"

class ParentCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateViewController()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Initial ViewController here
        let tableViewController = mainStoryboard.instantiateViewControllerWithIdentifier("dummyTableViewController")
        activeViewController = tableViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if isViewLoaded() {
            if let inactiveVC = inactiveViewController {
                inactiveVC.willMoveToParentViewController(nil)
                inactiveVC.view.removeFromSuperview()
                inactiveVC.removeFromParentViewController()
            }
        }
    }
    
    private func updateViewController() {
        if isViewLoaded() {
            if let activeVC = activeViewController {
                addChildViewController(activeVC)
                activeVC.view.frame = containerView.frame
                self.view.addSubview(activeVC.view)
                activeVC.didMoveToParentViewController(self)
            }
        }
    }
    
}

extension ParentCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return 10
    }
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier,
                forIndexPath: indexPath) as! ParentCollectionViewCell
            cell.setThumbnail(UIImage(named: "profile-pic")!)
            return cell
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("%li", indexPath.item)
        
        let tableViewController = mainStoryboard.instantiateViewControllerWithIdentifier("dummyTableViewController")
        let glkViewController = mainStoryboard.instantiateViewControllerWithIdentifier("dummyGLKViewController")
        
        if (indexPath.item == 0)    {
            activeViewController = tableViewController
        }
        if (indexPath.item == 1)   {
            activeViewController = glkViewController
        }
    }

    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath)    {
        
    }

}
