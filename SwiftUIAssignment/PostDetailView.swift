//
//  PostDetailView.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    @ObservedObject var viewModel: PostListViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(post.title)
                    .font(.title)
                    .bold()
                Spacer()
                Button(action: {
                    viewModel.toggleFavorite(post: post)
                }) {
                    Image(systemName: viewModel.isFavorite(post: post) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
            }
            Text(post.body)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle("Post Details")
    }
}
