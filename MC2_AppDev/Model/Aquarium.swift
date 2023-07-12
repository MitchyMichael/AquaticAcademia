//
//  Aquarium.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 11/07/23.
//

import Foundation

struct Aquarium {
    var aquarium_id: Int
    var aquarium_size: String
    var fish_array: [Fish]
//    var fish_amount: [Int]
    
//    init(aquarium_id: Int, aquarium_size: String, fish_array: [Fish], fish_amount: [Int]){
        init(aquarium_id: Int, aquarium_size: String, fish_array: [Fish]){
        self.aquarium_id = aquarium_id
        self.aquarium_size = aquarium_size
        self.fish_array = fish_array
//        self.fish_amount = fish_amount
    }
}
