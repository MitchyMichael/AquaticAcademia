//
//  InLevel_DescriptionView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 26/06/23.
//

import SwiftUI

struct InLevel_DescriptionPopUpView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var levelId: Int
    @State var hintCount: Int
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("level_description")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                    .padding(.leading, 4)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct InLevel_DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InLevel_DescriptionPopUpView(levelId: 0, hintCount: 0)
    }
}
