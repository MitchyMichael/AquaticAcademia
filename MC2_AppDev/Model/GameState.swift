//
//  GameState.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 03/07/23.
//

import Foundation

struct GameState {
    
    let listFish = GameFishData().fish_list
    
    // variables used for gameplay
    var editAccess = false
    var featuredFish:[Fish] = []
    var fishAmount:[Int] = []
    var aquariumList = [AquariumModel]()
    
    // function buat CRUD
}
