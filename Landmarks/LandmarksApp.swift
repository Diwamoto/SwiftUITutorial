//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by DaikiIwamoto on 2022/03/21.
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
