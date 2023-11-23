//
//  SkipperApp.swift
//  Skipper
//
//  Created by Farzad Rahman on 2023-09-27.
//

import SwiftUI

@main
struct SkipperApp: App {
    @State private var skips = Skip.sampleData
    var body: some Scene {
        WindowGroup {
            SkipsView(skips: $skips)
        }
    }
}
