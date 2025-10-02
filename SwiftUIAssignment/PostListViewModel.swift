//
//  PostListViewModel.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import Foundation


class PostListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var searchQuery: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var favoritePosts: Set<Int> = []

    private let service = PostService()

    var filteredPosts: [Post] {
        if searchQuery.isEmpty {
            return posts
        } else {
            return posts.filter { $0.title.lowercased().contains(searchQuery.lowercased()) }
        }
    }

    var favorites: [Post] {
        posts.filter { favoritePosts.contains($0.id) }
    }

    func toggleFavorite(post: Post) {
        if favoritePosts.contains(post.id) {
            favoritePosts.remove(post.id)
        } else {
            favoritePosts.insert(post.id)
        }
    }

    func isFavorite(post: Post) -> Bool {
        favoritePosts.contains(post.id)
    }

    func fetchPosts() {
        isLoading = true
        errorMessage = nil
        service.fetchPosts { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let posts):
                self.posts = posts
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
