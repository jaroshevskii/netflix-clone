//
//  URL+Mocks.swift
//  NetflixClone
//
//  Created by Sasha Jaroshevskii on 10/25/25.
//

import Foundation

extension URL {
  static let mockImageSmall = URL(string: "https://picsum.photos/id/10/200/300")!
  static let mockImageMedium = URL(string: "https://picsum.photos/id/20/400/600")!
  static let mockImageLarge = URL(string: "https://picsum.photos/id/30/800/1200")!

  static let mockPoster1 = URL(string: "https://picsum.photos/id/237/342/513")!
  static let mockPoster2 = URL(string: "https://picsum.photos/id/1025/342/513")!
  static let mockPoster3 = URL(string: "https://picsum.photos/id/1003/342/513")!

  static let mockBackdrop1 = URL(string: "https://picsum.photos/id/1005/1280/720")!
  static let mockBackdrop2 = URL(string: "https://picsum.photos/id/1018/1920/1080")!
  static let mockBackdrop3 = URL(string: "https://picsum.photos/id/1024/1600/900")!

  static let mockAvatar1 = URL(string: "https://picsum.photos/id/64/200/200")!
  static let mockAvatar2 = URL(string: "https://picsum.photos/id/65/200/200")!
  static let mockAvatar3 = URL(string: "https://picsum.photos/id/66/200/200")!

  static let mockTrendingAPI = URL(string: "https://example.com/api/trending")!
  static let mockPopularAPI = URL(string: "https://example.com/api/popular")!
  static let mockDetailAPI = URL(string: "https://example.com/api/title/42")!
}
