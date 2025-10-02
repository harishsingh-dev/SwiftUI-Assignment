//
//  FavoritesView.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: PostListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.favorites) { post in
                    NavigationLink(destination: PostDetailView(post: post, viewModel: viewModel)) {
                        PostRowView(
                            post: post,
                            isFavorite: viewModel.isFavorite(post: post),
                            onFavoriteToggle: { viewModel.toggleFavorite(post: post) }
                        )
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
