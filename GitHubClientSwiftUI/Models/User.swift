//
//  User.swift
//  GitHubClientSwiftUI
//
//  Created by 城野 on 2021/05/17.
//

import Foundation

struct User: Codable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}
