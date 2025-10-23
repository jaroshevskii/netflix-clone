//
//  HomeView.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/22/25.
//

import SwiftUI


struct User: Identifiable {
    let id: UUID
    let name: String
    let email: String
    
    static let mock = User(id: UUID(), name: "John Doe", email: "john@example.com")
}

struct MovieProductRow: Identifiable {
    let id: UUID
    let title: String
    let genre: String
    let rating: Double
    
    static let mocks: [MovieProductRow] = [
        MovieProductRow(id: UUID(), title: "Inception", genre: "Sci-Fi", rating: 8.8),
        MovieProductRow(id: UUID(), title: "The Dark Knight", genre: "Action", rating: 9.0),
        MovieProductRow(id: UUID(), title: "Interstellar", genre: "Sci-Fi", rating: 8.6),
        MovieProductRow(id: UUID(), title: "Parasite", genre: "Thriller", rating: 8.6),
        MovieProductRow(id: UUID(), title: "Joker", genre: "Drama", rating: 8.5),
        MovieProductRow(id: UUID(), title: "Avengers: Endgame", genre: "Action", rating: 8.4),
        MovieProductRow(id: UUID(), title: "La La Land", genre: "Musical", rating: 8.0),
        MovieProductRow(id: UUID(), title: "Titanic", genre: "Romance", rating: 7.8),
        MovieProductRow(id: UUID(), title: "The Matrix", genre: "Sci-Fi", rating: 8.7),
        MovieProductRow(id: UUID(), title: "The Godfather", genre: "Crime", rating: 9.2)
    ]
}

struct HomeView: View {
    @State private var filters = FilterModel.mocks
    @State private var selectedFilter: FilterModel? = nil
    @State private var headerStackHeight: CGFloat = 0
    @State private var heroProduct: HeroProduct? = nil
    @State private var currentUser: User? = nil
    @State private var productRows: [MovieProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                Color.clear.frame(height: headerStackHeight)
                
                VStack {
                    if let hero = heroProduct {
                        NetflixHeroCell(
                            imageResource: hero.imageResource,
                            isNetflixFilm: hero.isNetflixFilm,
                            title: hero.title,
                            categories: hero.categories,
                            onBackgroundPressed: {},
                            onPlayPressed: {},
                            onMyListPressed: {}
                        )
                        .padding()
                    }
                    
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(.red)
                            .frame(height: 200)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter
                ) { newFilter in
                    selectedFilter = newFilter
                } onXMarkPressed: {
                    selectedFilter = nil
                }
                .padding(.top, 16)
            }
            .overlay(
                GeometryReader { geo in
                    Color.clear.preference(key: HeaderHeightPreferenceKey.self, value: geo.size.height)
                }
            )
        }
        .foregroundStyle(.netflixWhite)
        .onPreferenceChange(HeaderHeightPreferenceKey.self) { value in
            headerStackHeight = value
        }
        .task {
           try? await loadData()
       }
   }

   private func loadData() async throws {
       try await Task.sleep(for: .seconds(1))
       heroProduct = HeroProduct.mock
       productRows = MovieProductRow.mocks
   }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {}
                Image(systemName: "magnifyingglass")
                    .onTapGesture {}
            }
            .font(.title2)
        }
    }
}

fileprivate struct HeaderHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

#Preview {
    HomeView()
}
