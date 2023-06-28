//
//  InLevel_DescriptionView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 26/06/23.
//

import SwiftUI

struct InLevel_DescriptionView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var levelId: Int
    @State var hintCount: Int
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("level_description")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    VStack{
                        Button {
                            dismiss()
                        } label: {
                            Image("btn_x_red")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                        }
                    }
                    .padding(.top,95)
                    .padding(.leading, 280)
                    
                    VStack{
                        NavigationLink(destination: InLevel_StorylineView(levelId: levelId, hintCount: hintCount), label: {
                            Image("btn_start_yellow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                        })
                    }
                    .padding(.top, 465)
                    
                    Spacer()
                }
            }

        }
        .navigationBarBackButtonHidden(true)

    }
}

struct InLevel_DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InLevel_DescriptionView(levelId: 0, hintCount: 0)
    }
}
