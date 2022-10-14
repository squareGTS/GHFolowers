//
//  GFRepoItemVC.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 19.09.2022.
//

import Foundation

class GFRepoItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureItems()
    }

    private func configureItems() {
        itemInfoViewOne.set(itemsInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemsInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }

    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }

}
