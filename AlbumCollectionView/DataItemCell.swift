//
//  DataItemCell.swift
//  AlbumCollectionView
//
//  Created by Khalid Naseem on 11/06/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

import UIKit

class DataItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var dataItemImageView: UIImageView!
    
    var dataItem: DataItem? {
        didSet {
            if let dataItem = dataItem {
                dataItemImageView.image = UIImage(named: dataItem.imageName)
            }
        }
    }
    
}