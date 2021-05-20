//
//  ContentView.swift
//  GitHubClientSwiftUI
//
//  Created by 城野 on 2021/05/14.
//

import SwiftUI

struct RepoListView: View {
    
    @StateObject private var viewModel = RepoListViewModel()
    
    var body: some View {
        
        NavigationView {
            Group {
                
                switch viewModel.repos {
                case .idle, .loading:
                    ProgressView("loading...")
                case .failed:
                    VStack {
                        Group {
                            Image("GitHubMark")
                            Text("Failed to load repositories.")
                                .padding(.top, 4)
                        }
                        .foregroundColor(.black)
                        .opacity(0.4)
                        Button(
                            action: {
                                viewModel.onRetryButtonTapped()
                            }, label: {
                                Text("Retry")
                                    .fontWeight(.bold)
                            }
                        )
                        .padding(.top, 8)
                    }
                case let .loaded(repos):
                    
                    if repos.isEmpty{
                        Text("No repositories")
                            .fontWeight(.bold)
                    } else {
                        List(repos) { repo in
                            
                            NavigationLink(
                                destination: RepoDetailView(repo: repo)){
                                RepoRow(repo: repo)
                            }
                        }
                        
                        
                    }
                    
                    
                }
            }
            .navigationTitle("Repositories")
        }
        .onAppear{
            viewModel.onAppear()
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}



enum Stateful <Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
