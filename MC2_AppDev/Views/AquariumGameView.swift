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
    @State var aquariumList: [Aquarium] = []
    @State var aquariumListSolution: [Aquarium] = []
    @State var fish_padding = [String:[Int]]()
    
    @State var editAccess = false
    @State private var showObjectives = true
    //    @State var isEdit = false
    @State var isAquariumClicked = false
    @State var isInputFish = false
    @State var isWinGame = false
    
    @State private var heartCount = 3
    
    @State var isActiveIndex: Int = -1
    
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
                        } else if heartCount < 2 {
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
                            // Heart Count
                            ForEach(0..<heartCount, id:\.self) { index in
                                if heartCount >= 0 {
                                    Image("ingame_heart")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 28)
                                }
                                
                                
                                
                                
                            }
                            Spacer()
                        }
                        .padding(.leading, 150)
                        .padding(.bottom, 450)
                    }
                    
                    // Navigation Back Button
                    if !editAccess && !isInputFish && !isWinGame && heartCount > 0 && !showObjectives {
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
                                    ZStack{
                                        Image("aquarium_foundation")
                                            .resizable()
                                            .scaledToFit()
                                        
                                        if isActiveIndex == index {
                                            Image("aquarium_foundation")
                                                .resizable()
                                                .scaledToFit()
                                                .brightness(0.25)
                                        }
                                        
                                        if editAccess{
                                            if (item.aquarium_size == "small") {
                                                VStack {
                                                    Button {
                                                        // Reset Value
                                                        if (isActiveIndex == index){
                                                            isActiveIndex = -1
                                                        }else {
                                                            isActiveIndex = index
                                                        }
                                                    } label: {
                                                        Image("aquarium_\(item.aquarium_size)")
                                                            .resizable()
                                                            .scaledToFit()
                                                    }
                                                }
                                                .padding(.horizontal, 95)
                                            } else if (item.aquarium_size == "medium") {
                                                VStack {
                                                    Button {
                                                        // Reset Value
                                                        if (isActiveIndex == index){
                                                            isActiveIndex = -1
                                                        }else {
                                                            isActiveIndex = index
                                                        }
                                                        print(isActiveIndex)
                                                    } label: {
                                                        Image("aquarium_\(item.aquarium_size)")
                                                            .resizable()
                                                            .scaledToFit()
                                                    }
                                                }
                                                .padding(.horizontal, 75)
                                                
                                                
                                            } else if (item.aquarium_size == "large") {
                                                VStack {
                                                    Button {
                                                        // Reset Value
                                                        if (isActiveIndex == index){
                                                            isActiveIndex = -1
                                                        }else {
                                                            isActiveIndex = index
                                                        }
                                                        print(isActiveIndex)
                                                    } label: {
                                                        Image("aquarium_\(item.aquarium_size)")
                                                            .resizable()
                                                            .scaledToFit()
                                                    }
                                                }
                                                .padding(.horizontal, 55)
                                                
                                                
                                            }
                                        }else{
                                            if (item.aquarium_size == "small") {
                                                Image("aquarium_\(item.aquarium_size)")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .padding(.horizontal, 95)
                                            } else if (item.aquarium_size == "medium") {
                                                Image("aquarium_\(item.aquarium_size)")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .padding(.horizontal, 75)
                                                
                                                
                                            } else if (item.aquarium_size == "large") {
                                                Image("aquarium_\(item.aquarium_size)")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .padding(.horizontal, 55)
                                                
                                                
                                            }
                                        }
                                        
                                        if editAccess {
                                            
                                            // Button for change aquarium size
                                            HStack{
                                                Button{
                                                    if (item.aquarium_size == "small") {
                                                        aquariumList[index].aquarium_size = "large"
                                                    } else if (item.aquarium_size == "medium") {
                                                        aquariumList[index].aquarium_size = "small"
                                                    } else if (item.aquarium_size == "large") {
                                                        aquariumList[index].aquarium_size = "medium"
                                                    }
                                                } label: {
                                                    Image("btn_left")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 20)
                                                }
                                                
                                                Spacer()
                                                
                                                Button {
                                                    if (item.aquarium_size == "small") {
                                                        aquariumList[index].aquarium_size = "medium"
                                                    } else if (item.aquarium_size == "medium") {
                                                        aquariumList[index].aquarium_size = "large"
                                                    } else if (item.aquarium_size == "large") {
                                                        aquariumList[index].aquarium_size = "small"
                                                    }
                                                } label: {
                                                    Image("btn_right")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 20)
                                                }
                                                
                                            }
                                            .padding(.horizontal, 10)
                                        }
                                        
                                        ZStack{
                                            
                                            ForEach(Array(zip(aquariumList[index].fish_array.indices, aquariumList[index].fish_array)), id: \.0){ innerIndex, fish in
                                                
                                                VStack{
                                                    if let fish_padding = fish_padding["aquarium_\(index)_fish_\(innerIndex)"]{
                                                        Image("fish_\(fish.english_name)")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 65, height: 65)
                                                            .padding(.top, CGFloat(fish_padding[0]))
                                                            .padding(.leading, CGFloat(fish_padding[1]))
                                                    }
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                    }
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                .dropDestination(for: String.self) { items, location in
                                    
                                    guard let fishQuery = listFish[items.first ?? ""] else {return false}
                                    aquariumList[index].fish_array.append(fishQuery)
                                    //
                                    if(aquariumList[index].aquarium_size == "large"){
                                        fish_padding["aquarium_\(index)_fish_\(aquariumList[index].fish_array.count-1)"] = [randomLocation(minValue: -75, maxValue: 50), randomLocation(minValue: -105, maxValue: 150)]
                                    } else if (aquariumList[index].aquarium_size == "medium"){
                                        fish_padding["aquarium_\(index)_fish_\(aquariumList[index].fish_array.count-1)"] = [randomLocation(minValue: -75, maxValue: 55), randomLocation(minValue: -85, maxValue: 112)]
                                    } else if (aquariumList[index].aquarium_size == "small"){
                                        fish_padding["aquarium_\(index)_fish_\(aquariumList[index].fish_array.count-1)"] = [randomLocation(minValue: -75, maxValue: 60), randomLocation(minValue: -65, maxValue: 75)]
                                    }
                                    
                                    return true
                                }
                            }
                            
                            // If in edit -> Aquariums
                            if editAccess {
                                Button {
                                    aquariumList.append(
                                        Aquarium(aquarium_id: aquariumList.count, aquarium_size: "large", fish_array: [])
                                    )
                                } label: {
                                    Image("btn_add_aquarium")
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                }
                            }
                            
                        }
                        .padding(.top, 270)
                        .padding(.bottom, 170)
                        
                    }
                    
                }
                
                // Button Objectives
                if !editAccess && !isInputFish && !isWinGame && heartCount > 0 && !showObjectives {
                    HStack{
                        Spacer()
                        VStack {
                            // Button for objectives
                            Button {
                                showObjectives = true
                            } label: {
                                Image("btn_hints")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                            // Button for checking
                            Button {
                                
                                // CURRENT AQUARIUM
                                var current_aquarium_fishes = [[String]]()
                                var index = 0
                                
                                for aquarium in aquariumList{
                                    var fishes_temp = [String]()
                                    
                                    for current_fishes in aquarium.fish_array {
                                        fishes_temp.append(current_fishes.english_name)
                                    }
                                    
                                    current_aquarium_fishes.append(fishes_temp)
                                    index += 1
                                }
                                
                                print("current : ", current_aquarium_fishes)
                                
                                // SOLUTION
                                aquariumListSolution = LevelSolution().level1_solution()
                                var current_aquarium_fishes_solution = [[String]]()
                                index = 0
                                
                                for aquarium in aquariumListSolution{
                                    var fishes_temp = [String]()
                                    
                                    for current_fishes in aquarium.fish_array {
                                        fishes_temp.append(current_fishes.english_name)
                                    }
                                    
                                    current_aquarium_fishes_solution.append(fishes_temp)
                                    index += 1
                                }
                                print("solution : ", current_aquarium_fishes_solution)
                                
                                
                                // SORT
                                // CURRENT
                                
                                // Sort each array inside multidimensional array
                                for index in 0...current_aquarium_fishes.count-1 {
                                    
                                    // check if there's empty aqarium
                                    if current_aquarium_fishes[index].count == 0 {
                                        if heartCount > 0 {
                                            heartCount = heartCount - 1
                                        } else {
                                            heartCount = 0
                                        }
                                        
                                        return
                                    }
                                    current_aquarium_fishes[index].sort()
                                }
                                
                                current_aquarium_fishes.sort{
                                    $0[0] < $1[0]
                                }
                                
                                // SOLUTION
                                for index in 0...current_aquarium_fishes_solution.count-1 {
                                    current_aquarium_fishes_solution[index].sort()
                                }
                                
                                current_aquarium_fishes_solution.sort{
                                    
                                    $0[0] < $1[0]
                                }
                                
                                if current_aquarium_fishes == current_aquarium_fishes_solution{
                                    isWinGame = true
                                } else {
                                    heartCount = heartCount - 1
                                }
                                
                                
                                
                            } label: {
                                Image("btn_check")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                        }
                        .padding(.top, 500)
                        .padding(.trailing)
                        .padding(.leading, 300)
                    }
                }
                
                // If in edit -> Action Button
                if editAccess {
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
                                
                                Spacer()
                                VStack{
                                    // Button remove
                                    Button {
                                        if(aquariumList.count > 0 && isActiveIndex != -1){
                                            aquariumList.remove(at: isActiveIndex)
                                            isActiveIndex = -1
                                        }
                                    } label: {
                                        Image("btn_ingame_remove")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .frame(width: 80)
                                
                                
                                Spacer()
                                //                                VStack{
                                //                                    // Button x
                                //                                    Button {
                                //                                        editAccess = false
                                //                                        isActiveIndex = -1
                                //                                    } label: {
                                //                                        Image("btn_ingame_x")
                                //                                            .resizable()
                                //                                            .scaledToFit()
                                //                                    }
                                //                                }
                                //                                .frame(width: 80)
                                //
                                VStack{
                                    // Button agree
                                    Button {
                                        editAccess = false
                                        isActiveIndex = -1
                                    } label: {
                                        Image("btn_ingame_agree")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .frame(width: 80)
                                
                                Spacer()
                                
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
                                    .padding(.trailing, 40)
                                }
                                .padding(.top, 690)
                                
                            }
                            .padding(.leading, 40)
                            
                            Spacer()
                            VStack{
                                Spacer()
                                // Button reset
                                Button {
                                    ResetFish()
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
                            if !isWinGame && heartCount > 0 && !showObjectives {
                                HStack{
                                    VStack{
                                        // Button build
                                        Button {
                                            editAccess = true
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
                    
                }
                
                // Pop up objectives
                if showObjectives == true {
                    popUpObjectives()
                }
                
                // Pop up good ending
                if isWinGame == true {
                    popUpGoodEnding()
                }
                
                // Pop up bad ending
                if heartCount <= 0 {
                    popUpBadEnding()
                }
                
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            
        }
        .onAppear(){
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
                .font(.custom(FontsManager.Metropolis.REGULAR, size: FontsManager.FontSize.Dialog))
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
                        .font(.custom(FontsManager.Metropolis.REGULAR, size: FontsManager.FontSize.Dialog))
                    //                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 520)
            .padding(.horizontal, 80)
            .padding(.bottom, 170)
            
            VStack{
                HStack{
                    Spacer()
                    NavigationLink(destination: MapView(), label: {
                        Text("Back to Map >>")
                            .font(.custom(FontsManager.Metropolis.REGULAR, size: FontsManager.FontSize.Dialog))
                            .foregroundColor(.primary)
                    })
                }
            }
            .padding(.trailing, 70)
            .padding(.top, 570)
        }
        
    }
    
    func popUpBadEnding() -> some View {
        ZStack{
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .opacity(0.5)
            
            VStack{
                Image("badending_popup")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .padding(.trailing)
            }
            
            VStack{
                ScrollView{
                    Text("\(bad_ending_fish_incompatibility[0])")
                        .font(.custom(FontsManager.Metropolis.REGULAR, size: FontsManager.FontSize.Dialog))
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.top, 530)
            .padding(.horizontal, 70)
            .padding(.bottom, 150)
            
            VStack{
                HStack{
                    Spacer()
                    NavigationLink(destination: MapView(), label: {
                        Text("Back to Map >>")
                            .font(.custom(FontsManager.Metropolis.REGULAR, size: FontsManager.FontSize.Dialog))
                            .foregroundColor(.primary)
                    })
                }
            }
            .padding(.trailing, 50)
            .padding(.top, 620)
        }
        
    }
    
    func RenderLevel() {
        (featuredFish, fishAmount, editAccess, aquariumList) = LevelRender().level1()
        
    }
    
    func ResetFish(){
        for index in 0...aquariumList.count-1 {
            aquariumList[index].fish_array = []
        }
    }
    
}

struct AquariumGame2_View_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGameView(levelId: 0, hintCount: 0)
    }
}
