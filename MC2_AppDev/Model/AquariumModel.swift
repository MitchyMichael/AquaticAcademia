//
//  Aquarium.swift
//  MC2_AppDev
//
//  Created by Reiner Anggriawan Jasin on 03/07/23.
//

import Foundation
import SwiftUI

// Model Object Aquarium
struct AquariumModel : Identifiable, Hashable {
    var id = UUID()
    var name: String
    var fishes: [String]
}
