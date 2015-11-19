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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}
