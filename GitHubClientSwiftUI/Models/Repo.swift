//
//  Repo.swift
//  GitHubClientSwiftUI
//
//  Created by 城野 on 2021/05/17.
//

import Foundation

struct Repo: Identifiable, Codable {
    var id: Int
    var name: String
    var owner: User
    var description: String?
    var stargazerCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
        case stargazerCount = "stargazers_count"
    }
}

