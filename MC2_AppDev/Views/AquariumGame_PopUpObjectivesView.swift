//
//  AquariumGame_PopUpInfoView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 28/06/23.
//

import SwiftUI

struct AquariumGame_PopUpObjectivesView: View {
    @State var levelId: Int
    
    var body: some View {
        VStack(spacing: .zero){
            Text("Info \(levelId)")
            
        }

    }
}

struct AquariumGame_PopUpObjectivesView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGame_PopUpObjectivesView(levelId: 0)
            .previewLayout(.sizeThatFits)
    }
}
