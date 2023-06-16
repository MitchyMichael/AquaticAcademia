//
//  DetailsView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("Details View")
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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
