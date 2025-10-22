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
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter
                ) { newFilter in
                    selectedFilter = newFilter
                } onXMarkPressed: {
                    selectedFilter = nil
                }
                .padding(.top, 16)
                
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
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
}

#Preview {
    HomeView()
}
