//
//  SwiftUIAssignmentApp.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import SwiftUI

@main
struct SwiftUIAssignmentApp: App {
    @StateObject private var viewModel = PostListViewModel()

        var body: some Scene {
            WindowGroup {
                TabView {
                    PostListView()
                        .tabItem {
                            Label("Posts", systemImage: "list.bullet")
                        }

                    FavoritesView(viewModel: viewModel)
                        .tabItem {
                            Label("Favorites", systemImage: "heart.fill")
                        }
                }
            }
        }
    }
