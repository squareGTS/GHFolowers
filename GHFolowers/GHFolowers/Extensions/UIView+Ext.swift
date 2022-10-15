//
//  UIView+Ext.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 14.10.2022.
//

import UIKit

extension UIView {

    func pinToEdges(of superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }

    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
