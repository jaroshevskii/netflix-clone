//
//  NetflixDetailView.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/26/25.
//

import SwiftUI

struct NetflixDetailView: View {
  var product: MovieProduct
  @State private var progress = 0.2
  @State private var isMyList = false
  @State private var products: [MovieProduct] = []
  
  var body: some View {
    ZStack {
      Color.netflixBlack
        .ignoresSafeArea()
      
      Color.netflixDarkGray
        .ignoresSafeArea()
        .opacity(0.3)
      
      VStack(spacing: 0) {
        NetflixDetailHeaderView(imageURL: .mockPoster2, progress: progress)
        
        ScrollView(.vertical) {
          VStack(alignment: .leading, spacing: 16) {
            detailsProductSection
            
            buttonsSection
            
            productsGridSection
          }
          .padding(8)
        }
        .scrollIndicators(.hidden)
      }
    }
    .task {
      try? await loadData()
    }
    .toolbar(.hidden, for: .navigationBar)
  }
  
  private var detailsProductSection: some View {
    NetflixDetailProductView(
      title: "Movie Title — Full",
      isNew: true,
      releasedYear: "2025",
      seasonsCount: 3,
      hasClosedCaptions: true,
      topTenRank: 6,
      descriptionText: "This is the full description for the selected title and it should go multiple lines.",
      castText: "Cast: Nick, Your Name, Someone Else"
    )
  }
  
  private var buttonsSection: some View {
    HStack(spacing: 32) {
      MyListButton(isMyList: isMyList) {
        isMyList.toggle()
      }
      
      RateButton { option in
        // do some shit
      }
      
      ShareButton(url: .mockAvatar1)
    }
    .padding(.leading, 32)
  }
  
  private var productsGridSection: some View {
    VStack(alignment: .leading) {
      Text("More Like This")
        .font(.headline)
      
      LazyVGrid(
        columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3),
        alignment: .center,
        spacing: 8
      ) {
        ForEach(products) { product in
          NetflixMovieCell(
            imageURL: product.imageURL,
            title: product.title,
            isRecentlyAdded: product.isRecentlyAdded,
            topTenRanking: nil
          )
        }
      }
    }
    .foregroundStyle(.netflixWhite)
  }
  
  private func loadData() async throws {
    guard products.isEmpty else { return }
    products = MovieProduct.mocksTop10
  }
}

#Preview {
  NetflixDetailView(product: .mock)
}

struct NetflixDetailHeaderView: View {
  var imageURL: URL
  var progress: Double
  var onAriPlayPressed: (() -> Void)? = nil
  var onXMarkPressed: (() -> Void)? = nil
  
  var body: some View {
    GeometryReader { proxy in
      ZStack(alignment: .bottom) {
        AsyncImage(url: imageURL) { phase in
          phase.image?
            .resizable()
            .scaledToFill()
            .frame(width: proxy.size.width, height: proxy.size.height)
            .clipped()
        }
        
        NetflixProgressView(progress: progress)
          .frame(height: 8)
          .padding(4)
          .animation(.linear, value: progress)
        
        HStack(spacing: 8) {
          Circle()
            .fill(.netflixDarkGray)
            .overlay(
              Image(systemName: "tv.badge.wifi")
                .offset(y: 1)
            )
            .frame(width: 36, height: 36)
            .onTapGesture {
              onAriPlayPressed?()
            }
          
          Circle()
            .fill(.netflixDarkGray)
            .overlay(
              Image(systemName: "xmark")
                .offset(y: 1)
            )
            .frame(width: 36, height: 36)
            .onTapGesture {
              onXMarkPressed?()
            }
        }
        .foregroundStyle(.netflixWhite)
        .font(.subheadline)
        .fontWeight(.bold)
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
      }
    }
    .aspectRatio(2, contentMode: .fit)
  }
}

#Preview("NetflixDetailHeaderView") {
  NetflixDetailHeaderView(
    imageURL: .mockPoster1,
    progress: 0.2
  )
}

fileprivate struct NetflixDetailProductView: View {
  var title: String
  var isNew: Bool
  var releasedYear: String
  var seasonsCount: Int?
  var hasClosedCaptions: Bool
  var topTenRank: Int?
  var descriptionText: String?
  var castText: String?
  var onPlayPressed: (() -> Void)? = nil
  var onDownloadPressed: (() -> Void)? = nil
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      HStack(spacing: 8) {
        if isNew {
          Text("New")
            .foregroundStyle(.green)
        }
        
        Text(releasedYear)
        
        if let seasonsCount {
          Text("\(seasonsCount) Seasons")
        }
        
        if hasClosedCaptions {
          Image(systemName: "captions.bubble")
        }
      }
      .foregroundStyle(.netflixLightGray)
      
      if let topTenRank {
        HStack(spacing: 8) {
          topTenIcon
          
          Text("#\(topTenRank) in TV Shows Today")
        }
      }
      
      VStack(spacing: 8) {
        Button("Play", systemImage: "play.fill") {
          onPlayPressed?()
        }
        .buttonStyle(.netflixPrimary)

        Button("Download", systemImage: "arrow.down.to.line.alt") {
          onDownloadPressed?()
        }
        .buttonStyle(.netflixSecondary)
        .frame(maxWidth: .infinity)
      }
      
      Group {
        if let descriptionText {
          Text(descriptionText)
        }
        
        if let castText {
          Text(castText)
            .foregroundStyle(.netflixLightGray)
        }
      }
      .font(.callout)
      .frame(maxWidth: .infinity, alignment: .leading)
      .multilineTextAlignment(.leading)
    }
    .foregroundStyle(.white)
  }
  
  private var topTenIcon: some View {
    HStack(spacing: 8) {
      Rectangle()
        .fill(.netflixDarkRed)
        .frame(width: 28, height: 28)
        .overlay(
          VStack(spacing: -4) {
            Text("TOP")
              .fontWeight(.bold)
              .font(.system(size: 8))
            Text("10")
              .fontWeight(.bold)
              .font(.system(size: 16))
          }
            .offset(y: 1)
        )
    }
  }
}

#Preview("NetflixDetailProductView") {
  ZStack {
    Color.black.ignoresSafeArea()
    
    VStack(spacing: 32) {
      NetflixDetailProductView(
        title: "Movie Title — Full",
        isNew: true,
        releasedYear: "2025",
        seasonsCount: 3,
        hasClosedCaptions: true,
        topTenRank: 6,
        descriptionText: "This is the full description for the selected title and it should go multiple lines.",
        castText: "Cast: Nick, Your Name, Someone Else"
      )

      NetflixDetailProductView(
        title: "Movie Title — Minimal",
        isNew: false,
        releasedYear: "2020",
        seasonsCount: nil,
        hasClosedCaptions: false,
        topTenRank: nil,
        descriptionText: nil,
        castText: nil
      )
    }
  }
}
