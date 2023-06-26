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
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    VStack{
                        Image(systemName: "circle")
                            .font(.system(size: 70))
                            .padding(.bottom, 1)
                        Text("Tetra - Level \(levelId)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        Text("Join Emma in creating a harmonious aquatic haven for her beloved fish! Help ensure the safety and happiness of Naga Indosiar, Ikan Biasa, and Mrs. Puff by guiding Emma in their perfect aquarium placement. Your expertise can make all the difference!")
                            .padding(.bottom)
                        
                        VStack{
                            Text("FEATURED FISHES")
                                .font(.caption)
                                .padding(.bottom, 1)
                            HStack{
                                Image(systemName: "circle")
                                    .font(.system(size: 30))
                                Image(systemName: "circle")
                                    .font(.system(size: 30))
                            }
                        }
                        .frame(width: 170)
                        .cornerRadius(8)
                        .padding()
                        .background(.gray)
                        .cornerRadius(8)
                    }
                }
                .padding(.vertical, 50)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(8)
                .padding(1)
                
                NavigationLink(destination: InLevel_StorylineView(levelId: levelId), label: {
                    Text("Start Game")
                        .fontWeight(.bold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 70)
                        .foregroundColor(.primary)
                        .font(.title2)
                        .background(.white)
                        .cornerRadius(8)
                        .padding(.vertical, 8)
                        
                })
            }
            .padding()
            .background(.gray)
            .cornerRadius(16)
            .padding()
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

struct InLevel_DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InLevel_DescriptionView(levelId: 0)
    }
}
