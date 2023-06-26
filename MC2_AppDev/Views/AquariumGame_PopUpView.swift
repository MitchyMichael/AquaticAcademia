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
        VStack(spacing: .zero){
            Text("Objectives \(levelId)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)
                
            Text("Objectives 1 \nObjectives 2 \nObjectives 3 \n- Blablablablablablablablablablabla \n- Blablablablablabla")
            
            
                
        }

    }
}

struct AquariumGame_PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGame_PopUpView(levelId: 0)
            .previewLayout(.sizeThatFits)
    }
}
