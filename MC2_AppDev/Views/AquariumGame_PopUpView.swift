//
//  AquariumGame_PopUpView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 26/06/23.
//

import SwiftUI

struct AquariumGame_PopUpView: View {
    @State var levelId: Int
    
    var body: some View {
        VStack(){
            Image("objective_popup")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
//            Text("Objectives \(levelId)")
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding(.bottom)
//
//            Text("Designing the Perfect Fish Arrangement for Emma's Aquarium. But remember,\n\n 1. Colorful fish is kind of aggresive and is only calm on the same colony\n\n 2. The pufferfish is very sensitive and shy")
            
            
                
        }

    }
}

struct AquariumGame_PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGame_PopUpView(levelId: 0)
            
    }
}
