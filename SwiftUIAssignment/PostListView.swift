//
//  PostListView.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import SwiftUI


struct PostListView: View {
    @StateObject private var viewModel = PostListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search posts...", text: $viewModel.searchQuery)
                    .padding(.horizontal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List {
                        ForEach(viewModel.filteredPosts) { post in
                            NavigationLink(destination: PostDetailView(post: post, viewModel: viewModel)) {
                                PostRowView(
                                    post: post,
                                    isFavorite: viewModel.isFavorite(post: post),
                                    onFavoriteToggle: { viewModel.toggleFavorite(post: post) }
                                )
                            }
                        }
                    }
                    .refreshable {
                        viewModel.fetchPosts()
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear { viewModel.fetchPosts() }
        }
    }
}
