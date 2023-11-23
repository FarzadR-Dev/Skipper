//
//  Skip.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-09-27.
//

import Foundation

import PhotosUI
import _PhotosUI_SwiftUI
import UIKit

struct Skip: Identifiable {
    
    let id: UUID
    var count: Int
    var date: Date
    var location: String
    var theme: Theme
    var image: UIImage?
    
//    var image: ImageResource
//    var video: FilePath
////    var stone: image (whether its a file location for an image or whatever)
    
    init(id: UUID = UUID(), count: Int, date: Date, location: String, theme: Theme
    ) {
        self.id = id
        self.count = count
        self.date = date
        self.location = location
        self.theme = theme
    }
}

extension Skip {
    static var emptySkip: Skip {
        Skip(count: 0, date: Date(), location: "", theme: .sky)
    }
}



extension Skip {
    static let sampleData: [Skip] =
    [
        Skip(count: 5, date: Date(), location: "Waterloo Park", theme: .teal),
        Skip(count: 9, date: Date(), location: "Victoria Park", theme: .magenta)
    ]
}
