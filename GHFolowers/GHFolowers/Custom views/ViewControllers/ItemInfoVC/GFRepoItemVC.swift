//
//  GFRepoItemVC.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 19.09.2022.
//

import Foundation

protocol GFRepoItemVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemVC: GFItemInfoVC {

    weak var delegate: GFRepoItemVCDelegate!

    init(user: User, delegate: GFRepoItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureItems()
    }

    private func configureItems() {
        itemInfoViewOne.set(itemsInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemsInfoType: .gists, with: user.publicGists)
        actionButton.set(color: .systemPurple, title: "GitHub Profile", systemImageName: "person")
    }

    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
