//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Tsubasa Ishihara on 2022/08/05.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
