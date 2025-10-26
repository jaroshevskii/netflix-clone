//
//  RateButton.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/26/25.
//

import SwiftUI

enum RateOption: CaseIterable {
  case dislike, like, love
  
  var title: String {
    switch self {
    case .dislike: "Not for me"
    case .like: "I like this"
    case .love: "Love this!"
    }
  }
  
  var iconName: String {
    switch self {
    case .dislike: "hand.thumbsdown"
    case .like: "hand.thumbsup"
    case .love: "bolt.heart"
    }
  }
}

struct RateButton: View {
  @State private var showPopover = false
  var onRationSelected: ((_ option: RateOption) -> Void)? = nil
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: "hand.thumbsup")
        .font(.title)
      
      Text("Rate")
        .font(.caption)
        .foregroundStyle(.netflixLightGray)
    }
    .foregroundStyle(.netflixWhite)
    .padding(8)
    .background(.black.opacity(0.001))
    .onTapGesture {
      showPopover.toggle()
    }
    .popover(isPresented: $showPopover) {
      ZStack {
        Color.netflixDarkGray.ignoresSafeArea()
        
        HStack(spacing: 12) {
          ForEach(RateOption.allCases, id: \.self) { option in
             rateButton(option: option)
          }
        }
        .padding(8)
      }
      .presentationCompactAdaptation(.popover)
    }
  }
  
  private func rateButton(option: RateOption) -> some View {
    VStack(spacing: 8) {
      Image(systemName: option.iconName)
        .font(.title2)
      Text(option.title)
        .font(.callout)
    }
    .foregroundStyle(.netflixWhite)
    .padding(4)
    .background(.black.opacity(0.001))
    .onTapGesture {
      showPopover = false
      onRationSelected?(option)
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    RateButton()
  }
}
