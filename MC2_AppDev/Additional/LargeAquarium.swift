//
//  LargeAquarium.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 27/06/23.
//

import SwiftUI

struct LargeAquarium: View {
    var body: some View {
        Text("Gambar Aquarium 1")
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .background(.gray)
            .padding(.bottom)
    }
}

struct LargeAquarium_Previews: PreviewProvider {
    static var previews: some View {
        LargeAquarium()
            .previewLayout(.sizeThatFits)
    }
}
