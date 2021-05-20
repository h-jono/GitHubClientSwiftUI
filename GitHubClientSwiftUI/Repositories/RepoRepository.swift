//
//  RepoRepository.swift
//  GitHubClientSwiftUI
//
//  Created by 城野 on 2021/05/20.
//

import Foundation
import Combine

struct RepoRepository {
    func fetchRepos() -> AnyPublisher<[Repo], Error> {
        RepoAPIClient().getRepos()
    }
}
