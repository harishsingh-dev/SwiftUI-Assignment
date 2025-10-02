//
//  PostRowView.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    let isFavorite: Bool
    let onFavoriteToggle: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(post.title).font(.headline)
                Text("User ID: \(post.userId)").font(.subheadline)
            }
            Spacer()
            Button(action: onFavoriteToggle) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
        }
    }
}
