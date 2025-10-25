//
//  HomeView.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/22/25.
//

import SwiftUI

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
                    if let heroProduct {
                        heroCell(product: heroProduct)
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
    
    private func heroCell(product: HeroProduct) -> some View {
        NetflixHeroCell(
            imageResource: product.imageResource,
            isNetflixFilm: product.isNetflixFilm,
            title: product.title,
            categories: product.categories,
            onBackgroundPressed: {},
            onPlayPressed: {},
            onMyListPressed: {}
        )
        .padding()
    }
    
    var categoryRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(productRows) { row in
                VStack(alignment: .leading) {
                    Text(row.title)
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(row.products) { product in
                                NetflixMovieCell(
                                    imageURL: product.imageURL,
                                    title: product.title,
                                    isRecentlyAdded: product.isRecentlyAdded,
                                    topTenRanking: product.topTenRanking
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                }
            }
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
