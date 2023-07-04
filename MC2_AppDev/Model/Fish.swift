//
//  Fish.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 03/07/23.
//

import Foundation

// Model Object Fish
class Fish {
    var latin_name: String
    var english_name: String
    var colony: [String]
    var environment: [String]
    var temperament: [String]
    var diet: String
    var compatibility: [String]
    var incompatibility: [String]

    init(latin_name: String, english_name: String, colony: [String], environment: [String], temperament: [String], diet: String, compatibility: [String], incompatibility: [String]) {
        self.latin_name = latin_name
        self.english_name = english_name
        self.colony = colony
        self.environment = environment
        self.temperament = temperament
        self.diet = diet
        self.compatibility = compatibility
        self.incompatibility = incompatibility
    }
    
    
//    var latin_name = "Paracheirodon innesi"
//    var english_name = "Neon Tetra"
//    var colony = ["School"]
//    var environment = ["Medium sized", "Large sized"]
//    var temperament = ["Peaceful", "Aggresive"]
//    var diet = ["Omnivore"]
//    var compatibility = ["Guppy", "Platy", "Molly"]
//    var incompatibility = ["Betta", "Tiger Barb", "Cichlids"]
    
}
