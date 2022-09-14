//
//  FollowerListVC.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 13.09.2022.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
