//
//  AquariumGame2_View.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 10/07/23.
//

import SwiftUI

struct AquariumGameView: View {
    
    @State var aquariums: [AquariumModel] = [AquariumModel(name: "Aquarium 1", fishes: ["🐟"])]
    @State var aquariumsTemp: [AquariumModel_Temp] = [AquariumModel_Temp(name: "Aquarium 1", fishes: ["🐟"])]
    
    @State var levelId: Int
    @State var hintCount: Int
    
    @State private var showObjectives = false
    @State var isEdit = false
    @State var isAquariumClicked = false
    @State var isGoodEnding = false
    @State var isInputFish = false
    
    @State private var heartCount = 3
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                ZStack {
                    
                    // Background
                    Image("bg_ingame_coklat1")
                        .resizable()
                        .scaledToFit()
                    
                    VStack{
                        Image("bg_ingame_atas")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    
                    // Character
                    HStack{
                        Image("ingame_char_confused")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        Spacer()
                    }
                    .padding(.leading, 70)
                    .padding(.bottom, 547)
                    
                    // Heart
                    ZStack{
                        HStack{
                            Image("ingame_chat_bubble")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .padding(.leading, 140)
                                .padding(.bottom, 480)
                            
                            Spacer()
                        }
                        
                        HStack{
                            ForEach(0..<heartCount) { index in
                                Image("ingame_heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28)
                            }
                            Spacer()
                        }
                        .padding(.leading, 150)
                        .padding(.bottom, 450)
                    }
                    
                    // Navigation
                    if !isEdit {
                        VStack {
                            HStack{
                                // === Map Navigation Button
                                NavigationLink(destination: MapView(), label: {
                                    Image("btn_back")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.trailing, 300)
                                })
                                Spacer()
                                
                            }
                            .padding()
                            .padding(.top, 40)
                            
                            Spacer()
                        }
                    }
                    
                    // Aquariums
                    VStack{
                        ScrollView {
                            ForEach(Array(zip(aquariums.indices, aquariums)), id: \.0) { index, item in
                                VStack{
                                    ZStack{
                                        Image("aquarium_foundation")
                                            .resizable()
                                            .scaledToFit()
                                        Image("aquarium_besar")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.horizontal, 50)
                                        HStack {
                                            ForEach(aquariums[index].fishes, id:\.self) { fish in
                                                Text(fish)
                                            }
                                        }
                                    }
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                .dropDestination(for: String.self) { items, location in
                                    aquariums[index].fishes.append(contentsOf: items)
                                    return true
                                }
                            }
                            
                            // If in edit -> Aquariums
                            if isEdit {
                                Button {
                                    aquariums.append(
                                        AquariumModel(name: "Aquarium \(aquariums.count+1)", fishes: [])
                                    )
                                } label: {
                                    Image("btn_add_aquarium")
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                }
                            }
                            
                        }
                        //                                                .background(.blue)
                        .padding(.top, 270)
                        .padding(.bottom, 170)
                        
                    }
                    
                }
                
                // Button Objectives
                if !isEdit {
                    HStack{
                        Spacer()
                        Button {
                            showObjectives = true
                        } label: {
                            Image("btn_hints")
                                .resizable()
                                .scaledToFit()
                        }
                        .padding(.top, 600)
                        .padding(.trailing)
                        .padding(.leading, 300)
                    }
                }
                
                // If in edit -> Action Button
                if isEdit {
                    ZStack {
                        VStack{
                            Spacer()
                            Image("bg_ingame_button_edit")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        VStack {
                            Spacer()
                            HStack{
                                VStack{
                                    // Button remove
                                    Button {
                                        
                                    } label: {
                                        Image("btn_ingame_remove")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .frame(width: 80)
                                
                                VStack{
                                    // Button x
                                    Button {
                                        isEdit = false
                                    } label: {
                                        Image("btn_ingame_x")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .frame(width: 80)
                                
                                VStack{
                                    // Button agree
                                    Button {
                                        isEdit = false
                                    } label: {
                                        Image("btn_ingame_agree")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .frame(width: 80)
                                
                            }
                            .padding()
                            .padding(.bottom, 20)
                        }
                    }
                    
                } else if isInputFish {
                    ZStack {
                        VStack{
                            Spacer()
                            Image("bg_ingame_button_fish")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        HStack {
                            Spacer()
                            VStack{
                                Spacer()
                                // Button agree
                                Button {
                                    isInputFish = false
                                } label: {
                                    Image("btn_ingame_reset")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            .frame(width: 80)
                            
                            VStack{
                                Spacer()
                                // Button agree
                                Button {
                                    isInputFish = false
                                } label: {
                                    Image("btn_ingame_agree")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            .frame(width: 80)
                            
                        }
                        .padding()
                        .padding(.bottom, 20)
                        .padding(.trailing, 8)
                    }
                    
                } else {
                    ZStack {
                        VStack{
                            Spacer()
                            Image("bg_ingame_button")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        VStack {
                            Spacer()
                            HStack{
                                VStack{
                                    // Button build
                                    Button {
                                        isEdit = true
                                    } label: {
                                        Image("btn_build")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .padding(.horizontal, 30)
                                .padding(.trailing)
                                
                                VStack{
                                    // Button add fish
                                    Button {
                                        isInputFish = true
                                    } label: {
                                        Image("btn_fish")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .padding(.horizontal, 30)
                                .padding(.leading)
                                
                                
                            }
                            .padding()
                            .padding(.bottom)
                        }
                    }
                    
                }
                
                VStack {
                    Spacer()
                    
                    //                    // == Button Good Ending / Bad Ending
                    //                    Button {
                    //                        isGoodEnding = true
                    //                    } label: {
                    //                        Text("Good Ending")
                    //                    }
                    
                    
                    
                    //                    HStack {
                    //                        Text("🐟")
                    //                            .padding()
                    //                            .background(.green)
                    //                            .draggable("🐟") {
                    //                                Text("🐟")
                    //                            }
                    //
                    //                        Text("🐠")
                    //                            .padding()
                    //                            .background(.pink)
                    //                            .draggable("🐠")
                    //
                    //                        Text("🐡")
                    //                            .padding()
                    //                            .background(.gray)
                    //                            .draggable("🐡")
                    //
                    //                        Spacer()
                    //
                    //                    }
                    //                    .padding()
                    //                    .background(.blue)
                }
                
                // Pop up objectives
                if showObjectives == true {
                    popUpObjectives()
                }
                
                // Pop up good ending
                if isGoodEnding == true {
                    popUpGoodEnding()
                }
                
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            
        }
        
    }
    
    func popUpObjectives() -> some View {
        ZStack{
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .opacity(0.5)
            
            AquariumGame_ObjectivesPopUpView(levelId: levelId)
                .padding(.bottom, 70)
            
            VStack{
                ScrollView{
                    if levelId == 1 {
                        ForEach(0..<level1_objective.count) { index in
                            HStack{
                                Text("\(level1_objective[index])")
                                Spacer()
                            }
                            
                        }
                    } else if levelId == 2 {
                        ForEach(0..<level2_objective.count) { index in
                            HStack{
                                Text("\(level2_objective[index])")
                                Spacer()
                            }
                            
                        }
                    } else if levelId == 3 {
                        ForEach(0..<level3_objective.count) { index in
                            HStack{
                                Text("\(level3_objective[index])")
                                Spacer()
                            }
                            
                        }
                    } else if levelId == 4 {
                        ForEach(0..<level4_objective.count) { index in
                            HStack{
                                Text("\(level4_objective[index])")
                                Spacer()
                            }
                            
                        }
                    }
                }
                .padding(.top, 280)
                .padding(.bottom, 340)
                .padding(.horizontal, 80)
            }
            
            Button{
                showObjectives = false
            } label: {
                Image("btn_start_yellow")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.top, 200)
            .padding(.horizontal, 120)
        }
        
        
    }
    
    func popUpGoodEnding() -> some View {
        ZStack{
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .opacity(0.5)
            
            VStack{
                Image("goodending_popup")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                Spacer()
            }
            
            HStack{
                Spacer()
                Image("balon_biru")
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing)
                    .padding(.leading, 300)
                    .padding(.top, 400)
            }
            
            HStack{
                Image("balon_merahkuning")
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, 270)
                    .padding(.leading)
                    .padding(.top, 550)
                Spacer()
            }
            
            VStack{
                ScrollView{
                    Text("\(good_ending[0])")
                    //                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 480)
            .padding(.horizontal, 80)
            .padding(.bottom, 130)
            
            VStack{
                NavigationLink(destination: MapView(), label: {
                    Text("Back to Map")
                })
            }
            .padding(.top, 550)
        }
        
    }
    
}

struct AquariumGame2_View_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGameView(levelId: 0, hintCount: 0)
    }
}
