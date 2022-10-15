//
//  UITableView+Ext.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 15.10.2022.
//

import UIKit

extension UITableView {

    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
