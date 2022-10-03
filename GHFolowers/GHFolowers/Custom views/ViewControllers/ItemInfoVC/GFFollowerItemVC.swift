//
//  GFFollowerItemVC.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 19.09.2022.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureItems()
    }

    private func configureItems() {
        itemInfoViewOne.set(itemsInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemsInfoType: .following, with: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }

}
