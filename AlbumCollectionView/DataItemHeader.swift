//
//  DataItemHeader.swift
//  AlbumCollectionView
//
//  Created by Khalid Naseem on 11/06/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//


import UIKit

class DataItemHeader: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
}
