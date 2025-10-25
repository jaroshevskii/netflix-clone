//
//  NetflixMovieCell.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/25/25.
//

import SwiftUI

struct NetflixMovieCell: View {
    var width = 90.0
    var height = 140.0
    var imageURL: URL = .mockImageSmall
    var title: String? = "Movie Title"
    var isRecentlyAdded = false
    var topTenRanking: Int? = nil
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            
            ZStack(alignment: .bottom) {
                AsyncImage(url: imageURL) { phase in
                    phase.image?.resizable()
                }
            
                VStack(spacing: 0) {
                    if let firstWord = title?.components(separatedBy: " ").first {
                        Text(firstWord)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    
                    Text("Recently Added")
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .frame(maxWidth: .infinity)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .background(.netflixDarkRed)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 2,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 2
                            )
                        )
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .padding(.top, 6)
                .background(
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(0),
                            .netflixBlack.opacity(0.3),
                            .netflixBlack.opacity(0.4),
                            .netflixBlack.opacity(0.4),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .frame(width: width, height: height)
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            NetflixMovieCell(topTenRanking: 1)
            NetflixMovieCell(isRecentlyAdded: true, topTenRanking: 10)
            NetflixMovieCell()
        }
    }
}
