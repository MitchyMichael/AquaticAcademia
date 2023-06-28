//
//  SmallAquarium.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 27/06/23.
//

import SwiftUI

struct SmallAquarium: View {
    var body: some View {
        HStack{
            Text("Gambar Aquarium 1")
                .foregroundColor(.primary)
                .frame(width: 150)
                .frame(height: 150)
                .background(.gray)
                .padding(.bottom)
            Spacer()
        }
        
    }
}

struct SmallAquarium_Previews: PreviewProvider {
    static var previews: some View {
        SmallAquarium()
    }
}
