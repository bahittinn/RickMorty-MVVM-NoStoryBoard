//
//  UIHelper.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

func createFlowLayout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    let itemWidth = CGFloat.dWidth / 2
    
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: itemWidth - 20, height: itemWidth * 1.5)
    layout.minimumLineSpacing = 10

    return layout
}
