//
//  CollectionView+Ext.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
