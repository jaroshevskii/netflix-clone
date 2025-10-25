//
//  MovieProductRow.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/25/25.
//

import Foundation

struct MovieProductRow: Identifiable {
  let id: UUID
  var title: String
  let genre: String
  let rating: Double
  let products: [MovieProduct]

  static let mocks: [MovieProductRow] = [
    MovieProductRow(
      id: UUID(),
      title: "Trending Now",
      genre: "Mixed",
      rating: 0.0,
      products: MovieProduct.mocksTrending
    ),
    MovieProductRow(
      id: UUID(),
      title: "Top 10 in the U.S. Today",
      genre: "Mixed",
      rating: 0.0,
      products: MovieProduct.mocksTop10
    ),
    MovieProductRow(
      id: UUID(),
      title: "Sci-Fi Favorites",
      genre: "Sci-Fi",
      rating: 0.0,
      products: MovieProduct.mocksSciFi
    ),
    MovieProductRow(
      id: UUID(),
      title: "Award Winners",
      genre: "Drama",
      rating: 0.0,
      products: MovieProduct.mocksAwardWinners
    )
  ]
}
