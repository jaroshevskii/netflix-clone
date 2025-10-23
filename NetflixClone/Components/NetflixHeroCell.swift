//
//  NetflixHeroCell.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/23/25.
//

import SwiftUI

struct NetflixHeroCell: View {
    var imageResource = ImageResource.moviePoster
    var isNetflixFilm = true
    var title = "Players"
    var categories = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .onTapGesture { onBackgroundPressed?()}
            
            VStack {
                if isNetflixFilm {
                    NetflixLogoView()
                        .shadow(color: .black, radius: 8)
                }

                Text(title)
                    .fontDesign(.serif)
                    .font(.system(size: 60))
                    .foregroundStyle(.netflixWhite)
                    .shadow(color: .black, radius: 8)
                    
                Text(categories.joined(separator: " • "))
                    .font(.headline)
                    .foregroundStyle(.netflixWhite)
                    .shadow(color: .black, radius: 8)
                
                HStack(spacing: 12) {
                    Button("Play", systemImage: "play.fill") {
                        onPlayPressed?()
                    }
                    .buttonStyle(.netflixPrimary)

                    Button("My List", systemImage: "plus") {
                        onMyListPressed?()
                    }
                    .buttonStyle(.netflixSecondary)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: [
                        .netflixBlack.opacity(0),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .aspectRatio(0.8, contentMode: .fit)
    }
}

#Preview {
    NetflixHeroCell(isNetflixFilm: true)
        .padding()
}
