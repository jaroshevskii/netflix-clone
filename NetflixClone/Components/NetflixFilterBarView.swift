//
//  NetflixFilterBarView.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/22/25.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
  let title: String
  let isDropdown: Bool
}

extension FilterModel {
  static let mocks = [
    FilterModel(title: "TV Shows", isDropdown: false),
    FilterModel(title: "Movies ", isDropdown: false),
    FilterModel(title: "Categories", isDropdown: true),
  ]
}

// TODO: Під час переходу анімації, можна вибрати інший фільтр який зникає
struct NetflixFilterBarView: View {
  var filters: [FilterModel] = FilterModel.mocks
  var selectedFilter: FilterModel? = nil
  var onFilterPressed: ((FilterModel) -> Void)? = nil
  var onXMarkPressed: (() -> Void)? = nil
    
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        if selectedFilter != nil {
          Image(systemName: "xmark")
            .padding(8)
            .background(
              Circle()
                .stroke(lineWidth: 1)
            )
            .foregroundStyle(.netflixLightGray )
            .background(Color.black.opacity(0.001))
            .onTapGesture {
              onXMarkPressed?()
            }
            .padding(.leading, 16)
            .transition(.move(edge: .leading))
        }

        ForEach(filters, id: \.self) { filter in
          if selectedFilter == nil || selectedFilter == filter {
            NetflixFilterCell(
              title: filter.title,
              isDropdown: filter.isDropdown,
              isSelected: selectedFilter == filter
            )
            .background(Color.blue.opacity(0.001))
            .onTapGesture {
              onFilterPressed?(filter)
            }
            .padding(
              .leading,
              (selectedFilter == nil && filter == filters.first) ? 16 : 0
            )
          }
        }
      }
      .padding(.vertical, 4)
    }
    .scrollIndicators(.hidden )
    .animation(.bouncy, value: selectedFilter)
  }
}

fileprivate struct NetflixFilterBarViewPreview: View {
  @State private var filters = FilterModel.mocks
  @State private var selectedFilter: FilterModel? = nil
    
  var body: some View {
    NetflixFilterBarView(
      filters: filters,
      selectedFilter: selectedFilter
    ) { newFilter in
      selectedFilter = newFilter
    } onXMarkPressed: {
      selectedFilter = nil
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    NetflixFilterBarViewPreview()
  }
}
