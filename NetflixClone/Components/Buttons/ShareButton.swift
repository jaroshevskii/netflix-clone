//
//  ShareButton.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/26/25.
//

import SwiftUI

struct ShareButton: View {
  var url: URL
  
  var body: some View {
    ShareLink(item: url) {
      VStack(spacing: 8) {
        Image(systemName: "paperplane")
          .font(.title)
        
        Text("Share")
          .font(.callout)
          .foregroundStyle(.netflixLightGray)
      }
      .foregroundStyle(.netflixWhite)
      .padding(8)
      .background(.black.opacity(0.001))
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    ShareButton(url: .mockAvatar1)
  }
}
