//
//  DataItem.swift
//  AlbumCollectionView
//
//  Created by Khalid Naseem on 11/06/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

import UIKit

class DataItem {
    var title: String
    var kind: Kind
    var imageName: String
    
    init(title: String, kind: Kind, imageName: String) {
        self.title = title
        self.kind = kind
        self.imageName = imageName
    }
}

enum Kind: Int {
    case Beach
    case Plant
    case Animal
    
    func description() -> String {
        switch self {
        case .Beach:
            return "Best Beaches 💧💧💧"
        case .Plant:
            return "Favourite Plants 🌿 🌳"
        case .Animal:
            return "Animals 🐼 🐱"
        }
    }
}
