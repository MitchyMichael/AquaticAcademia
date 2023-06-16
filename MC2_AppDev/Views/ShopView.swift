//
//  ShopView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 15/06/23.
//

import SwiftUI

struct ShopView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Text("Shop View")
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

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
