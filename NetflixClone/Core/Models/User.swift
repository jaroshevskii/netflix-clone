//
//  User.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/25/25.
//

import Foundation

struct User: Identifiable {
    let id: UUID
    let name: String
    let email: String
}

extension User {
    static let mock = User(id: UUID(), name: "John Doe", email: "john@example.com")
}
