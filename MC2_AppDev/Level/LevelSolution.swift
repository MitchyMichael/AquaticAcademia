//
//  LevelSolution.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 04/07/23.
//

import Foundation

class LevelSolution {
    
    let listFish = GameFishData().fish_list
    
    // variables used for gameplay
    var aquariumList = [Aquarium]()
    
    // hardcoded value per stage
    // === LEVEL 1 ===
    func level1_solution() -> ([Aquarium]) {
        
        guard let neonTetra = listFish["Neon Tetra"] else{return []}
        guard let platy = listFish["Platy"] else{return []}
        guard let betta = listFish["Betta"] else{return []}
        
        aquariumList.append(Aquarium(aquarium_id: 0, aquarium_size: "small", fish_array: [betta]))
        aquariumList.append(Aquarium(aquarium_id: 1, aquarium_size: "medium", fish_array: [neonTetra,neonTetra,neonTetra,neonTetra, platy,platy]))
        
        return aquariumList
    }
    
    
    
}
