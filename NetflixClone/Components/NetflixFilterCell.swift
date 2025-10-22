//
//  NetflixFilterCell.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/22/25.
//

import SwiftUI

struct NetflixFilterCell: View {
    var title = "Category"
    var isDropdown = true
    var isSelected = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(Color.netflixDarkGray)
                    .opacity(isSelected ? 1 : 0)
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle (Color.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            NetflixFilterCell()
            NetflixFilterCell(isSelected: true )
            NetflixFilterCell(isDropdown: false)
        }
    }
}
