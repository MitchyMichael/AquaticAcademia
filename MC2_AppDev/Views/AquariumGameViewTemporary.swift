//
//  MapViewTemporary.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 06/07/23.
//

import SwiftUI

// Aquarium Class
//struct AquariumTemp : Identifiable, Hashable {
//    var id = UUID()
//    var name: String
//    var fishes: [String]
//}


struct AquariumGameViewTemporary: View {
    var body: some View {
        NavigationStack{
            
        }
    }
    
    // Get aquarium data sent from other class
    //    @State var aquariums: [AquariumTemp] = [AquariumTemp(name: "Aquarium 1", fishes: ["🐟"])]
//    @State var aquariums: [Aquarium] = [Aquarium(aquarium_id: 0, aquarium_size: "medium", fish_array: [], fish_amount: [])]
//
//    let listFish = GameFishData().fish_list
//
//    var body: some View {
//
//        // Geometry Reader
//        GeometryReader { geo in
//            VStack {
//                List {
//                    ForEach(Array(zip(aquariums.indices, aquariums)), id: \.0) { index, item in
//                        VStack {
//                            ZStack {
//                                Image("game_aquarium_background")
//                                    .resizable()
//                                    .scaledToFill()
//                                Image("aquarium_medium")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .padding(.all, 8)
//
//                                HStack {
//                                    ForEach(aquariums[index].fish_array, id:\.english_name) { fish in
////                                        Text(
////                                            fish.english_name
////                                        )
//                                        Image("fish_\(fish.english_name)")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 65, height: 65)
//                                    }
//                                }
//                            }
//                        }
//                        .dropDestination(for: String.self) { items, location in
//                            //                            aquariums[index].fishes.append(contentsOf: items)
//
//                            guard let fishQuery = listFish[items.first ?? ""] else {return false}
//                            //
//                            //                            let addedFish = Fish(latin_name: "tes", english_name: "\(items.first ?? "")", colony: ["tes"], environment: ["tes"], temperament: ["Tes"], diet: "Omnivore", compatibility: ["tes"], incompatibility: ["tes"])
//                            //                            aquariums[index].fish_array.append(addedFish)
//                            aquariums[index].fish_array.append(fishQuery)
//                            return true
//                        }
//                    }
//                }.frame(height: geo.size.height/2)
//
//                Button {
//                    aquariums.append(
//                        Aquarium(aquarium_id: aquariums.count, aquarium_size: "medium", fish_array: [], fish_amount: [])
//                    )
//                } label: {
//                    Text("Add Aquarium")
//                }
//
//
//                HStack {
//                    ZStack (alignment: .top){
//                        Image("aquarium_add")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 120, height: 120)
//                        VStack {
//                            Image("fish_Neon Tetra")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 65, height: 65)
//                                .padding()
//                        }
//                    }
//                    .draggable("Neon Tetra")
//
//                    ZStack (alignment: .top){
//                        Image("aquarium_add")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 120, height: 120)
//                        VStack {
//                            Image("fish_Platy")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 65, height: 65)
//                                .padding()
//                        }
//                    }
//                    .draggable("Platy")
//
//                    ZStack (alignment: .top){
//                        Image("aquarium_add")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 120, height: 120)
//                        VStack {
//                            Image("fish_Betta")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 65, height: 65)
//                                .padding()
//                        }
//                    }
//                    .draggable("Betta")
//
//                    //
//                    //                    Text("🐠")
//                    //                        .padding()
//                    //                        .background(.pink)
//                    //                        .draggable("🐠")
//                    //
//                    //                    Text("🐡")
//                    //                        .padding()
//                    //                        .background(.gray)
//                    //                        .draggable("🐡")
//
//                }
//            }
//
//
//
//        }
        
//    }
    
    //    func RenderLevel () {
    //        let featuredFish, fishAmount, editAccess, aquariumList = LevelRender.level1()
    //    }
}

struct AquariumGameViewTemporary_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGameViewTemporary()
    }
}
