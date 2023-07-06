//
//  AquariumGame_PopUpView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 26/06/23.
//

import SwiftUI

struct AquariumGame_ObjectivesPopUpView: View {
    @State var levelId: Int
    
    var body: some View {
        ZStack {
            Image("objective_popup")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .padding(.horizontal, 40)
        }
    }
}

struct AquariumGame_PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGame_ObjectivesPopUpView(levelId: 0)
    }
}
