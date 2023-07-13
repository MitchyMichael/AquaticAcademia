//
//  LevelRender.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 04/07/23.
//

import Foundation

class LevelRender {
    
    let listFish = GameFishData().fish_list
    
    // variables used for gameplay
    var editAccess = false
    var featuredFish:[Fish] = []
    var fishAmount:[Int] = []
    var aquariumList = [Aquarium]()
    
    // hardcoded value per stage
    // === LEVEL 1 ===
    func level1() -> ([Fish], [Int], Bool, [Aquarium]) {
//
//        var featuredFish: [Fish]
//        var fishAmount: [Int]
//        var editAccess = false
//        var aquariumList: [Aquarium]
        
        // If needed
        // editAccess = true
        
        // Variable for each featured fish in a stage
        guard let neonTetra = listFish["Neon Tetra"] else{return ([], [], false, [])}
        featuredFish.append(neonTetra)
        fishAmount.append(4)
        
        guard let platy = listFish["Platy"] else{return ([], [], false, [])}
        featuredFish.append(platy)
        fishAmount.append(2)
        
        guard let betta = listFish["Betta"] else{return ([], [], false, [])}
        featuredFish.append(betta)
        fishAmount.append(1)

        
        // Used to render the aquarium on stage (put the fishes in a specific aquarium)
        aquariumList.append(Aquarium(aquarium_id: 0, aquarium_size: "large", fish_array: []))
        aquariumList.append(Aquarium(aquarium_id: 0, aquarium_size: "small", fish_array: []))
        aquariumList.append(Aquarium(aquarium_id: 1, aquarium_size: "medium", fish_array: []))
        
        // featuredfish adalah ikan yang nanti bisa didrag and drop
        // fishAmount adalah jumlah masing masing ikan
        // editAccess adalah kemampuan user untuk mengubah aquarium
        // aquariumList adalah untuk mengrender empty tank
        return (featuredFish, fishAmount, editAccess, aquariumList)
    }
    
}
