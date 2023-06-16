//
//  CollectionView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI

struct CollectionView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Collection View")
                NavigationLink(destination: DetailsView(), label: {
                    Text("Details View")
                })
            }
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

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
