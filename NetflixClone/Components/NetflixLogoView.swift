//
//  NetflixLogoView.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/23/25.
//

import SwiftUI

struct NetflixLogoView: View {
    var body: some View {
        HStack {
            Image(.logo)
                .resizable()
                .frame(width: 32, height: 32)
            
            Text("FILM")
                .kerning(4)
                .font(.title2)
                .foregroundStyle(.netflixWhite)
        }
    }
}

#Preview {
    NetflixLogoView()
        .padding()
        .background(.black)
}
