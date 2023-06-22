//
//  Baner.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import Foundation

struct Banner {
    static func allBanners() -> [Photo] {
        [
            .init(id: 1, imageName: "advBanner"),
            .init(id: 2, imageName: "advBanner"),
            .init(id: 3, imageName: "advBanner"),
            .init(id: 4, imageName: "advBanner")
        ]
    }
}

struct Photo {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}
