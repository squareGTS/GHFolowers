//
//  FavoritesListVC.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 13.09.2022.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue

        PersistanceManager.retriveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }

}
