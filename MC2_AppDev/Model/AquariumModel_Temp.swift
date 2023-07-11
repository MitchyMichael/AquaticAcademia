//
//  AquariumModel_Temp.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 11/07/23.
//

import Foundation
import SwiftUI

// Model Object Aquarium
struct AquariumModel_Temp : Identifiable, Hashable {
    var id = UUID()
    var name: String
    var fishes: [String]
}
