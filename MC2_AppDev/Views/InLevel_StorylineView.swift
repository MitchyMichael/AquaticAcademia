//
//  InLevel_StorylineView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 26/06/23.
//

import SwiftUI

struct InLevel_StorylineView: View {
    @State var levelId: Int
    @State var hintCount: Int
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bg_storyline")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                Image("bg_storyline_ruangtamu")
                    .resizable()
                    .ignoresSafeArea()
                HStack{
                    Image("char_smiling")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                    Spacer()
                }
                .padding(.bottom, 70)
                
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Image("mascot")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 280, alignment: .topLeading)
                            .clipped()
                    }
                }
                
                VStack{
                    NavigationLink(destination: AquariumGameView(levelId: levelId, hintCount: hintCount), label: {
                        Text("Alright! I got it!")
                            .foregroundColor(.primary)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 50)
                            .background(.gray)
                            .cornerRadius(8)
                    })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct InLevel_StorylineView_Previews: PreviewProvider {
    static var previews: some View {
        InLevel_StorylineView(levelId: 0, hintCount: 0)
    }
}
