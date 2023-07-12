//
//  AquariumGame2_View.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 10/07/23.
//

import SwiftUI

struct AquariumGameView: View {
    
    
    
    
    let listFish = GameFishData().fish_list
    
    @State var levelId: Int
    @State var hintCount: Int
    
    // In Game Render
    @State var featuredFish: [Fish] = []
    @State var fishAmount: [Int] = []
    @State var editAccess = false
    @State var aquariumList: [Aquarium] = []
    
    @State private var showObjectives = true
    @State var isEdit = false
    @State var isAquariumClicked = false
    @State var isGoodEnding = false
    @State var isInputFish = false
    
    @State private var heartCount = 3
    
    @State var fish_padding = [String:[Int]]()
    
    
    
//
//    init(levelId: Int, hintCount: Int, featuredFish: [Fish], fishAmount: [Int], editAccess: Bool = false, aquariumList: [Aquarium], showObjectives: Bool = true, isEdit: Bool = false, isAquariumClicked: Bool = false, isGoodEnding: Bool = false, isInputFish: Bool = false, heartCount: Int = 3, fish_padding: [String : [Int]] = [String:[Int]]()) {
//        self.levelId = levelId
//        self.hintCount = hintCount
//        self.featuredFish = featuredFish
//        self.fishAmount = fishAmount
//        self.editAccess = editAccess
//        self.aquariumList = aquariumList
//        self.showObjectives = showObjectives
//        self.isEdit = isEdit
//        self.isAquariumClicked = isAquariumClicked
//        self.isGoodEnding = isGoodEnding
//        self.isInputFish = isInputFish
//        self.heartCount = heartCount
//        self.fish_padding = fish_padding
//
//        RenderLevel()
////        print(featuredFish)
////                        print(fishAmount)
////                        print(editAccess)
////                        print(aquariumList)
//    }
    
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
                        if heartCount == 3 {
                            Image("ingame_char_happy")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                        } else if heartCount == 2 {
                            Image("ingame_char_confused")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                        } else if heartCount == 1 {
                            Image("ingame_char_sad")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                        }
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
                    if !isEdit && !isInputFish{
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
                            ForEach(Array(zip(aquariumList.indices, aquariumList)), id: \.0) { index, item in
                                VStack{
//                                    Text("Index:\(index)")
                                    ZStack{
                                        Image("aquarium_foundation")
                                            .resizable()
                                            .scaledToFit()
                                        Image("aquarium_besar")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.horizontal, 50)
                                        //                                        LazyHGrid (rows:[GridItem(.flexible())]){
                                        ZStack{
//                                            ForEach(Array(aquariumList[index].fish_array.enumerated()), id: \.element.english_name) { (innerIndex, fish) in
                                                ForEach(Array(zip(aquariumList[index].fish_array.indices, aquariumList[index].fish_array)), id: \.0){ innerIndex, fish in
//                                                print(fish_padding["aquarium_0_fish_0)"] ?? 0)
//                                                guard let currentPadding = fish_padding["aquarium_\(index)_fish_\(innerIndex)" ?? ""] else {}
                                                
                                                VStack{
//                                                    Text("Inner Index: \(innerIndex)").background(.blue)
                                                    if let fish_padding = fish_padding["aquarium_\(index)_fish_\(innerIndex)"]{
                                                        Image("fish_\(fish.english_name)")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 65, height: 65)
                                                            .padding(.top, CGFloat(fish_padding[0]))
                                                            .padding(.leading, CGFloat(fish_padding[1]))
//                                                        Text("\(fish_padding[0])")
                                                    }
                                                    
                                                    
//                                                        .padding(.leading, randomLeadingPadding)
                                                }
//                                                .background(.red)
//                                                .padding(.top, String(50))
//                                                .padding(.leading, 50)
                                                
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                    }
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                .dropDestination(for: String.self) { items, location in
                                    //                            aquariums[index].fishes.append(contentsOf: items)
                                    
                                    guard let fishQuery = listFish[items.first ?? ""] else {return false}
                                    //
                                    //                            let addedFish = Fish(latin_name: "tes", english_name: "\(items.first ?? "")", colony: ["tes"], environment: ["tes"], temperament: ["Tes"], diet: "Omnivore", compatibility: ["tes"], incompatibility: ["tes"])
                                    //                            aquariums[index].fish_array.append(addedFish)
                                    aquariumList[index].fish_array.append(fishQuery)
                                    
                                    fish_padding["aquarium_\(index)_fish_\(aquariumList[index].fish_array.count-1)"] = [randomLocation(minValue: -70, maxValue: 60), randomLocation(minValue: -100, maxValue: 150)]
                                    //                                    print("MASUK\(index)")
                                    print("Kondisii loop",aquariumList[index].fish_array.enumerated())
                                    print("tes, ", "aquarium_\(index)_fish_\(aquariumList[index].fish_array.count-1)")
                                    print(fish_padding)
//                                    print(fish_padding)
                                    return true
                                }
                            }
                            
                            // If in edit -> Aquariums
                            if isEdit {
                                Button {
                                    aquariumList.append(
                                        Aquarium(aquarium_id: aquariumList.count, aquarium_size: "Large", fish_array: [], fish_amount: [])
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
                if !isEdit && !isInputFish{
                    HStack{
                        Spacer()
                        Button {
//                            showObjectives = true
                            RenderLevel()
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
                            VStack {
                                Spacer()
                                ScrollView{
                                    
                                    VStack {
                                        ForEach(featuredFish, id: \.english_name){ fish in
                                            
                                            ZStack {
                                                Image("aquarium_add")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 80, height: 80)
                                                Image("fish_\(fish.english_name)")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50)
                                            }
                                            .draggable("\(fish.english_name)")
                                        }
                                    }
                                }
                                .padding(.top, 690)
                                
                            }
                            .padding(.leading, 40)
                            
                            Spacer()
                            VStack{
                                Spacer()
                                // Button reset
                                Button {
                                    
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
                
//                VStack {
//                    Spacer()
//                    
//                                        // == Button Good Ending / Bad Ending
//                                        Button {
//                                            isGoodEnding = true
//                                        } label: {
//                                            Text("Good Ending")
//                                        }
//                    
//                    
//                    
//                }
                
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
            
        }.onAppear(){
            RenderLevel()
        }
        
    }
    
    func randomLocation(minValue: Int, maxValue: Int) -> Int{
        let randomInt = Int.random(in: minValue..<maxValue)
        
        return randomInt
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
                .padding(.top, 320)
                .padding(.bottom, 380)
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
    
    func RenderLevel() {
        (featuredFish, fishAmount, editAccess, aquariumList) = LevelRender().level1()
        print("MASUK")
        print(featuredFish)
        print(fishAmount)
        print(editAccess)
        print(aquariumList)
    }
    
}

struct AquariumGame2_View_Previews: PreviewProvider {
    static var previews: some View {
//        AquariumGameView(levelId: 1, hintCount: 3, featuredFish: [Fish(latin_name: "tes", english_name: "Neon Tetra", colony: [], environment: [], temperament: [], diet: "Omnivore", compatibility: [], incompatibility: [])], fishAmount: [1], aquariumList: [Aquarium(aquarium_id: 0, aquarium_size: "medium", fish_array: [], fish_amount: [])], fish_padding: ["aquarium_0_fish_0": [50, 50]])
        AquariumGameView(levelId: 0, hintCount: 0)
    }
}
