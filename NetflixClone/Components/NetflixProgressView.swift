//
//  NetflixProgressView.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/26/25.
//

import SwiftUI

struct NetflixProgressView: View {
  let progress: CGFloat

  var body: some View {
    GeometryReader { proxy in
      ZStack(alignment: .leading) {
        Rectangle()
          .frame(width: proxy.size.width, height: 8)
          .opacity(0.3)
          .foregroundColor(.netflixLightGray)

        Rectangle()
          .frame(
            width: min(progress * proxy.size.width, proxy.size.width),
            height: 8
          )
          .foregroundColor(.netflixDarkRed)
      }
      .clipShape(.capsule)
    }
  }
}

#Preview {
  VStack {
    NetflixProgressView(progress: 0.0)
      .frame(height: 8)
      .padding(.horizontal)

    NetflixProgressView(progress: 0.5)
      .frame(height: 8)
      .padding(.horizontal)

    NetflixProgressView(progress: 1.0)
      .frame(height: 8)
      .padding(.horizontal)
  }
  .padding()
}
