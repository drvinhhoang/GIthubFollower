//
//  User.swift
//  GitHubFlollowers
//
//  Created by VINH HOANG on 13/11/2021.
//

import Foundation
struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?

    let htmlUrl: String
    let following: Int
    let followers: Int
}
