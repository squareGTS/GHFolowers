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

        NetworkManger.shared.getFolowers(for: username, page: 1) { result in

            switch result {
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print(followers)

            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
