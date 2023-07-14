//
//  MC2_AppDevApp.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI
import AVKit

@main
struct MC2_AppDevApp: App {
    
    @State var audioPlayer: AVAudioPlayer!
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
                    
                    let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer.numberOfLoops = -1
                    self.audioPlayer.play()
                    
                }
        }
    }
}
