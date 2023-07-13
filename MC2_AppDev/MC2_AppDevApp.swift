//
//  MC2_AppDevApp.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI
@main
struct MC2_AppDevApp: App {
    
    @StateObject private var fishData:FishData = FishData()
    @AppStorage("firstTime") var firstTime = true
    
    var body: some Scene {
        WindowGroup {
//            AquariumGameView(levelId: 1, hintCount: 3)
            ContentView()
                .environment(\.managedObjectContext, fishData.container.viewContext)
                .onAppear {
                    if firstTime {
                        fishData.seedGlossary()
                        firstTime = false
                    }
                }
        }
    }
}
