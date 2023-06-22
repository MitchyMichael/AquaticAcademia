//
//  AquariumGameView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 22/06/23.
//

import SwiftUI

struct AquariumGameView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            DraggableIcon()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label : {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .foregroundColor(.primary)
                }
            }
        }
        
    }
}

struct AquariumGameView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGameView()
    }
}
