//
//  User.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 14.09.2022.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarURL: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGist: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
