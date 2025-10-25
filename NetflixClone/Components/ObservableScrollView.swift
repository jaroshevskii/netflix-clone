//
//  ObservableScrollView.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/25/25.
//

import SwiftUI

struct ObservableScrollView<Content: View>: View {
  private let axes: Axis.Set
  private let content: Content
  @Binding var contentOffset: Double

  init(
    _ axes: Axis.Set = .vertical,
    contentOffset: Binding<Double>,
    @ViewBuilder content: () -> Content
  ) {
    self.axes = axes
    self._contentOffset = contentOffset
    self.content = content()
  }

  var body: some View {
    ScrollView(axes) {
      content
        .background {
          GeometryReader { proxy in
            Color.clear
              .preference(
                key: ContentOffsetKey.self,
                value: proxy.frame(in: .named("scrollView")).minY
              )
                        
          }
        }
    }
    .coordinateSpace(name: "scrollView")
    .onPreferenceChange(ContentOffsetKey.self) { value in
      self.contentOffset = value
    }
  }
}

fileprivate struct ContentOffsetKey: PreferenceKey {
  typealias Value = CGFloat
    
  static var defaultValue = CGFloat.zero
    
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
