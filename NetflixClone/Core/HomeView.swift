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
  @State private var scrollOffset = 0.0
    
  var body: some View {
    ZStack(alignment: .top) {
      Color.netflixBlack.ignoresSafeArea()
      
      backgroundGradientLayer
      
      scrollViewLayer

      fullHeaderWithFilter
    }
    .foregroundStyle(.netflixWhite)
    .onPreferenceChange(HeaderHeightPreferenceKey.self) { value in
      if headerStackHeight == .zero {
        headerStackHeight = value
      }
    }
    .task {
      try? await loadData()
    }
  }

  private func loadData() async throws {
    if heroProduct == nil {
      heroProduct = HeroProduct.mock
    }
    if productRows.isEmpty {
      productRows = MovieProductRow.mocks
    }
  }
  
  private var backgroundGradientLayer: some View {
    ZStack {
      LinearGradient(
        colors: [.netflixDarkGray.opacity(1), .netflixDarkGray.opacity(0)],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()
      
      LinearGradient(
        colors: [.netflixDarkRed.opacity(0.5), .netflixDarkRed.opacity(0)],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()
    }
    .frame(maxHeight: max(10, 400 + (scrollOffset * 0.75)))
    .opacity(scrollOffset < -250 ? 0 : 1)
    .animation(.easeInOut, value: scrollOffset)
  }
  
  private var scrollViewLayer: some View {
    ObservableScrollView(contentOffset: $scrollOffset) {
      Color.clear
        .frame(height: headerStackHeight)
              
      VStack {
        if let heroProduct {
          heroCell(product: heroProduct)
        }
                  
        categoryRows
      }
    }
    .scrollIndicators(.hidden)
  }
  
  private var fullHeaderWithFilter: some View {
    VStack(spacing: 0) {
      header
        .padding(.horizontal, 16)
      
      if scrollOffset > -20 {
        NetflixFilterBarView(
          filters: filters,
          selectedFilter: selectedFilter
        ) { newFilter in
          selectedFilter = newFilter
        } onXMarkPressed: {
          selectedFilter = nil
        }
        .padding(.top, 16)
        .transition(.move(edge: .top).combined(with: .opacity))
      }
    }
    .padding(.bottom, 8)
    .background(
      ZStack {
        if scrollOffset < -70 {
          Rectangle()
            .fill(.clear)
            .background(.ultraThinMaterial)
            .brightness(-0.2)
            .ignoresSafeArea()
        }
      }
    )
    .animation(.smooth, value: scrollOffset)
    .overlay(
      GeometryReader { geo in
        Color.clear
          .preference(
            key: HeaderHeightPreferenceKey.self,
            value: geo.size.height
          )
      }
    )
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
