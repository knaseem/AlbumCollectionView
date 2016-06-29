//
//  CollectionViewController.swift
//  AlbumCollectionView
//
//  Created by Khalid Naseem on 11/06/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    @IBAction func deleteButtonTapped(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Delete Image", message: "Tap on Image to Delete", preferredStyle: .Alert)
        
        /* let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive, handler: {(alert :UIAlertAction!) in
         println("Delete button tapped")
         })
         alertController.addAction(deleteAction)    */
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) {
            (_) -> Void in }
        
        alertController.addAction(okAction)
        
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        let item = DataItem(title: "New Item", kind: .Animal, imageName: "images/default.jpeg")
        let index = allItems[0].count
        allItems[0].append(item)
        let indexPath = NSIndexPath(forItem: index, inSection: 0)
        collectionView?.insertItemsAtIndexPaths([indexPath])
        
    }
    
    var beachDataItems = [DataItem]()
    var plantDataItems = [DataItem]()
    var animalDataItems = [DataItem]()
    
    var allItems = [[DataItem]]()
    
    override func viewDidLoad() {
        
        for i in 1...12 {
            if i > 9 {
                beachDataItems.append(DataItem(title: "Title #\(i)", kind: Kind.Beach, imageName: "images/beach\(i).jpg"))
            } else  {
                beachDataItems.append(DataItem(title: "Title #0\(i)", kind: Kind.Beach, imageName: "images/beach0\(i).jpg"))
            }
        }
        
        
        for i in 1...12 {
            if i > 9 {
                plantDataItems.append(DataItem(title: "Another Title #\(i)", kind: Kind.Plant, imageName: "images/img\(i).jpg"))
            } else {
                plantDataItems.append(DataItem(title: "Another Title #0\(i)", kind: Kind.Plant, imageName: "images/img0\(i).jpg"))
            }
        }
        
        
        for i in 1...12 {
            if i > 9 {
                animalDataItems.append(DataItem(title: "Another Title #\(i)", kind: Kind.Animal, imageName: "images/anim\(i).jpg"))
            } else  {
                animalDataItems.append(DataItem(title: "Another Title #0\(i)", kind: Kind.Animal, imageName: "images/anim0\(i).jpg"))
            }
        }
        
        
        allItems.append(beachDataItems)
        allItems.append(plantDataItems)
        allItems.append(animalDataItems)
        
        super.viewDidLoad()
        
        let width = CGRectGetWidth(collectionView!.frame) / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        
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
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return allItems.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allItems[section].count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! DataItemCell
        let dataItem = allItems[indexPath.section][indexPath.row]
        cell.dataItem = dataItem
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "SectionHeader", forIndexPath: indexPath) as! DataItemHeader
        var title = ""
        if let kind = Kind(rawValue: indexPath.section) {
            title = kind.description()
        }
        sectionHeader.title = title
        
        return sectionHeader
    }
    
    
    
    // delete cells
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.allItems[indexPath.section].removeAtIndex(indexPath.row)
        self.collectionView?.deleteItemsAtIndexPaths([indexPath])
        
        
    }
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
}
