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

        }

    }
}

struct AquariumGame_PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGame_PopUpView(levelId: 0)
            
    }
}
