//
//  FarmAppApp.swift
//  FarmApp
//
//  Created by くりメガネ on 2022/01/02.
//

import SwiftUI

@main
struct FarmAppApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
