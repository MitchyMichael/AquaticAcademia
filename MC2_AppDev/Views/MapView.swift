//
//  MapView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI
import AVKit

struct MapView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var levelId = 0
    @State var thisLevelReward = 0
    @State var hintCount = 0
    
    @State var isLevelClicked = false
    @State var showDecisionGameView = false
    @State var showLevelDescription = false
    @State var isNavigateNext = false
    
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView {
                    ZStack{
                        Image("bg_map")
                            .resizable()
                            .scaledToFit()
                        
                        VStack{
                            // Level 1
                            VStack{
                                Button {
                                    showLevelDescription = true
                                    levelId = 1
                                    hintCount = 3
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 110)
                                }
                                
                                
                            }
                            .padding(.top, 230)
                            .padding(.trailing, 100)
                            
                            //Level 2
                            VStack{
                                Button{
                                    showLevelDescription = true
                                    levelId = 2
                                    hintCount = 2
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                            }
                            .padding(.top, 60)
                            .padding(.trailing, 170)
                            
                            // Level 3
                            VStack{
                                Button{
                                    showLevelDescription = true
                                    levelId = 3
                                    hintCount = 2
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                            }
                            .padding(.top, 70)
                            .padding(.trailing, 20)
                            
                            // Level 4
                            VStack{
                                Button{
                                    showLevelDescription = true
                                    levelId = 4
                                    hintCount = 1
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl4")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                            }
                            .padding(.top, 70)
                            .padding(.leading, 80)
                            
                            // Level 5
                            VStack{
                                Button{
                                    showLevelDescription = true
                                    levelId = 5
                                    hintCount = 0
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl5")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150)
                                }
                            }
                            .padding(.top, 70)
                            .padding(.trailing, 160)
                            
                            // Level 6
                            VStack{
                                Button{
                                    showLevelDescription = true
                                    levelId = 6
                                    hintCount = 0
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl6")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                            }
                            .padding(.top, 60)
                            .padding(.trailing, 200)
                            
                            // Level 7
                            VStack{
                                Button{
                                    showLevelDescription = true
                                    levelId = 7
                                    hintCount = 0
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl7")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                            }
                            .padding(.top, 70)
                            .padding(.trailing, 50)
                            
                            // Level 8
                            VStack{
                                Button{
                                    showLevelDescription = true
                                    levelId = 8
                                    hintCount = 0
                                    
                                    playSFX()
                                } label: {
                                    Image("btn_lvl8")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                            }
                            .padding(.top, 70)
                            .padding(.leading, 80)
                            
                            Spacer()
                        }
                    }
                    
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
                
                VStack{
//                    HStack(alignment: .top){
//                        Spacer()
//                        VStack{
//                            NavigationLink(destination: CollectionView(), label: {
//                                Image("btn_collection")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 80)
//                            })
//                        }
//                        .padding(.top, 80)
//                    }
//                    .font(.title2)
//                    .padding()
//                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                
                if showLevelDescription == true {
                    popUpLevelDescription()
                    
                }
            }
            //            .background(.blue)
        }
        
    }
    
    func playSFX() {
        let sound = Bundle.main.path(forResource: "sfx_btn", ofType: "wav")
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        self.audioPlayer.play()
    }
    
    func popUpLevelDescription() -> some View {
        ZStack{
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .opacity(0.5)
            InLevel_DescriptionPopUpView(levelId: levelId, hintCount: hintCount)
            
            ScrollView{
//                Text("\(level1_guiding_info[0])")
//                    .font(.caption)
                if levelId == 1 {
                    Text("\(level1_guiding_info[0])")
                        .font(.caption)
                } else if levelId == 2 {
                    Text("\(level2_guiding_info[0])")
                        .font(.caption)
                } else if levelId == 3 {
                    Text("\(level3_guiding_info[0])")
                        .font(.caption)
                } else if levelId == 4 {
                    Text("\(level4_guiding_info[0])")
                        .font(.caption)
                } else {
                    Text("To Be Done...")
                        .font(.caption)
                }
            }
            .padding(.horizontal, 90)
            .padding(.top, 370)
            .padding(.bottom, 300)
            
            
            VStack{
                VStack{
                    Button {
                        showLevelDescription = false
                        playSFX()
                    } label: {
                        Image("btn_x_red")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45)
                    }
                }
                .padding(.top, 80)
                .padding(.leading, 280)
                
                VStack{
                    NavigationLink(destination: InLevel_StorylineView(levelId: levelId, hintCount: hintCount), isActive: $isNavigateNext, label: {
                        Image("btn_start_yellow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .onTapGesture {
                                playSFX()
                                isNavigateNext = true
                            }
                        
                    })
                }
                .padding(.top, 450)
                
                Spacer()
            }

        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
