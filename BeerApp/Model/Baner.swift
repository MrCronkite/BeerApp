

import Foundation

struct Photo {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}
