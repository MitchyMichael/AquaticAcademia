//
//  ContentView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @State var isNavigateNext = false
    
    init(){
            UINavigationBar.setAnimationsEnabled(false)
        }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bg_contentview")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    Image("logo_aquatic_academia")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 40)
                        .padding(.bottom, 100)
                    
                    NavigationLink(destination: MapView(), isActive: $isNavigateNext, label: {
                        Image("tombol_play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .onTapGesture {
                                let sound = Bundle.main.path(forResource: "sfx_btn", ofType: "wav")
                                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                                self.audioPlayer.play()
                                isNavigateNext = true
                            }
                    })
                }
                .padding(.bottom, 200)
                
            }
            
        }
        .preferredColorScheme(.light)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
