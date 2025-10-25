import Foundation
import SwiftUI

/// Represents the featured (hero) item shown at the top of Home.
struct HeroProduct: Identifiable, Hashable {
  let id: UUID
  /// A display title for the hero item.
  let title: String
  /// Content categories or tags to show under the title.
  let categories: [String]
  /// Whether the item is a Netflix film (vs a series).
  let isNetflixFilm: Bool
  /// The image to display in the hero cell. Using ImageResource if your project has asset catalog resources; falls back to a system image when previewing.
  let imageResource: ImageResource

  init(
    id: UUID = UUID(),
    title: String,
    categories: [String],
    isNetflixFilm: Bool,
    imageResource: ImageResource
  ) {
    self.id = id
    self.title = title
    self.categories = categories
    self.isNetflixFilm = isNetflixFilm
    self.imageResource = imageResource
  }
}

extension HeroProduct {
  /// Lightweight mock for development and previews.
  static var mock: HeroProduct {
    // Replace `ImageResource("hero_placeholder")` with a real asset resource if available in your project.
    // Using a generated ImageResource initializer assumes you have an asset named "hero_placeholder".
    // If not, add an image to your asset catalog with that name, or change the name below.
    HeroProduct(
      title: "Top Pick Today",
      categories: ["Action", "Sci‑Fi", "Thriller"],
      isNetflixFilm: true,
      imageResource: .moviePoster
    )
  }
}
