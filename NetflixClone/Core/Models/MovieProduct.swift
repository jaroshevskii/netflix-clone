//
//  MovieProduct.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/25/25.
//

import Foundation

struct MovieProduct: Identifiable {
    let id: UUID
    let title: String
    let imageURL: URL
    let isRecentlyAdded: Bool
    let topTenRanking: Int?
}

extension MovieProduct {
    static let mocksTrending = [
        MovieProduct(id: UUID(), title: "Inception", imageURL: URL(string: "https://picsum.photos/id/11/200/300")!, isRecentlyAdded: true, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "Dune: Part Two", imageURL: URL(string: "https://picsum.photos/id/12/200/300")!, isRecentlyAdded: true, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "Oppenheimer", imageURL: URL(string: "https://picsum.photos/id/13/200/300")!, isRecentlyAdded: false, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "Everything Everywhere All at Once", imageURL: URL(string: "https://picsum.photos/id/14/200/300")!, isRecentlyAdded: false, topTenRanking: nil)
    ]
    static let mocksTop10 = [
        MovieProduct(id: UUID(), title: "The Dark Knight", imageURL: URL(string: "https://picsum.photos/id/10/200/300")!, isRecentlyAdded: false, topTenRanking: 1),
        MovieProduct(id: UUID(), title: "Joker", imageURL: URL(string: "https://picsum.photos/id/11/200/300")!, isRecentlyAdded: false, topTenRanking: 2),
        MovieProduct(id: UUID(), title: "Avengers: Endgame", imageURL: URL(string: "https://picsum.photos/id/12/200/300")!, isRecentlyAdded: false, topTenRanking: 3),
        MovieProduct(id: UUID(), title: "Spider-Man: No Way Home", imageURL: URL(string: "https://picsum.photos/id/13/200/300")!, isRecentlyAdded: false, topTenRanking: 4),
        MovieProduct(id: UUID(), title: "John Wick 4", imageURL: URL(string: "https://picsum.photos/id/14/200/300")!, isRecentlyAdded: false, topTenRanking: 5),
        MovieProduct(id: UUID(), title: "Fast X", imageURL: URL(string: "https://picsum.photos/id/15/200/300")!, isRecentlyAdded: false, topTenRanking: 6),
        MovieProduct(id: UUID(), title: "Mission Impossible 7", imageURL: URL(string: "https://picsum.photos/id/16/200/300")!, isRecentlyAdded: false, topTenRanking: 7),
        MovieProduct(id: UUID(), title: "The Batman", imageURL: URL(string: "https://picsum.photos/id/17/200/300")!, isRecentlyAdded: false, topTenRanking: 8),
        MovieProduct(id: UUID(), title: "Black Panther: Wakanda Forever", imageURL: URL(string: "https://picsum.photos/id/18/200/300")!, isRecentlyAdded: false, topTenRanking: 9),
        MovieProduct(id: UUID(), title: "Guardians of the Galaxy 3", imageURL: URL(string: "https://picsum.photos/id/19/200/300")!, isRecentlyAdded: false, topTenRanking: 10)
    ]
    static let mocksSciFi = [
        MovieProduct(id: UUID(), title: "Interstellar", imageURL: URL(string: "https://picsum.photos/id/120/200/300")!, isRecentlyAdded: false, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "The Matrix", imageURL: URL(string: "https://picsum.photos/id/121/200/300")!, isRecentlyAdded: false, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "Blade Runner 2049", imageURL: URL(string: "https://picsum.photos/id/122/200/300")!, isRecentlyAdded: false, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "Arrival", imageURL: URL(string: "https://picsum.photos/id/23/200/300")!, isRecentlyAdded: false, topTenRanking: nil)
    ]
    static let mocksAwardWinners = [
        MovieProduct(id: UUID(), title: "Parasite", imageURL: URL(string: "https://picsum.photos/id/130/200/300")!, isRecentlyAdded: false, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "The Godfather", imageURL: URL(string: "https://picsum.photos/id/131/200/300")!, isRecentlyAdded: false, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "La La Land", imageURL: URL(string: "https://picsum.photos/id/132/200/300")!, isRecentlyAdded: false, topTenRanking: nil),
        MovieProduct(id: UUID(), title: "Schindler’s List", imageURL: URL(string: "https://picsum.photos/id/133/200/300")!, isRecentlyAdded: false, topTenRanking: nil)
    ]
}
