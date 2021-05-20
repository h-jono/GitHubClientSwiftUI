//
//  RepoDetailView.swift
//  GitHubClientSwiftUI
//
//  Created by 城野 on 2021/05/17.
//

import SwiftUI

struct RepoDetailView: View {
    let repo: Repo
    
    var body: some View {
        ScrollView{
            HStack {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image("GitHubMark")
                            .resizable()
                            .frame(width: 16.0, height: 16.0)
                        Text(repo.owner.name)
                            .font(.caption)
                    }
                    Text(repo.name)
                        .font(.body)
                        .fontWeight(.semibold)
                    if let description = repo.description {
                        Text(description)
                            .padding(.top, 4)
                    }
                    HStack {
                        Image(systemName: "star")
                        Text("\(repo.stargazerCount) stars")
                            .font(.caption)
                    }
                    .padding(.top, 8)
                    Spacer()
                }
                .padding()
                Spacer()
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(repo: .mock1)
    }
}
