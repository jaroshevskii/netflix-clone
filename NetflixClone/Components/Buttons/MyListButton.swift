//
//  MyListButton.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/26/25.
//

import SwiftUI

struct MyListButton: View {
  var isMyList = false
  var onButtonPressed: (() -> Void)? = nil
  
  var body: some View {
    VStack(spacing: 8) {
      ZStack {
        Image(systemName: "plus")
          .opacity(isMyList ? 0 : 1)
          .rotationEffect(Angle(degrees: isMyList ? 180 : 0))
          .scaleEffect(isMyList ? 0.5 : 1.0)
        
        Image(systemName: "checkmark")
          .opacity(isMyList ? 1 : 0)
          .rotationEffect(Angle(degrees: isMyList ? 0 : -180))
                .scaleEffect(isMyList ? 1.0 : 0.5)
      }
      .font(.title)
      
      Text("My List")
        .font(.caption)
        .foregroundStyle(.netflixLightGray)
    }
    .foregroundStyle(.netflixWhite)
    .padding(8)
    .background(.black.opacity(0.001))
    .animation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.1), value: isMyList)
    .onTapGesture {
      onButtonPressed?()
    }
  }
}

fileprivate struct MyListButtonPreview: View {
  @State private var isMyList = false
  
  var body: some View {
    MyListButton(isMyList: isMyList) {
      isMyList.toggle()
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    MyListButtonPreview()
  }
}
