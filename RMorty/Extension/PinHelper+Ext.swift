//
//  UIHelper+Ext.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import UIKit

extension UIView {
    func pintoEdges(view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func pintoEdgeCustom(view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
