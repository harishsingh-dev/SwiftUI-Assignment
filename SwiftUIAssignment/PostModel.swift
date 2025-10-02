//
//  PostModel.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import Foundation

struct Post: Identifiable, Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
