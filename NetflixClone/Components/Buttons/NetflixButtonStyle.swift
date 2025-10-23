//
//  NetflixButtonStyle.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/23/25.
//

import SwiftUI

enum NetflixButtonType {
    case primary
    case secondary
}

struct NetflixButtonStyle: ButtonStyle {
    var type: NetflixButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(backgroundColor(for: type))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .foregroundColor(foregroundColor(for: type))
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private func backgroundColor(for type: NetflixButtonType) -> Color {
        switch type {
        case .primary: .netflixWhite
        case .secondary: .netflixDarkGray
        }
    }
    
    private func foregroundColor(for type: NetflixButtonType) -> Color {
        switch type {
        case .primary: .black
        case .secondary: .netflixWhite
        }
    }
}

extension ButtonStyle where Self == NetflixButtonStyle {
    static var netflixPrimary: Self { Self(type: .primary) }
    static var netflixSecondary: Self { Self(type: .secondary) }
}

#Preview("NetflixButtonStyle") {
    VStack(spacing: 16) {
        Button(action: {}) {
            Label("Play", systemImage: "play.fill")
                .labelStyle(.titleAndIcon)
        }
        .buttonStyle(.netflixPrimary)
        
        Button(action: {}) {
            Label("My List", systemImage: "plus")
                .labelStyle(.titleAndIcon)
        }
        .buttonStyle(.netflixSecondary)
    }
    .padding()
    .background(.black)
}
