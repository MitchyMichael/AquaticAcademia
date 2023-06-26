//
//  AquariumGameView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 22/06/23.
//

import SwiftUI

struct AquariumGameView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showText = true
    @State var levelId: Int
    
    var body: some View {
        NavigationStack{
            
//            VStack {
//                DraggableIcon()
//            }
            
            ZStack{
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                if showText == true {
                    VStack{
                        AquariumGame_PopUpView(levelId: levelId)
                            .frame(maxWidth: 250)
                            .padding(.horizontal)
                            .padding(.top)
                            
                        Button{
                            showText = false
                        } label: {
                            Text("Start Label")
                                .foregroundColor(.primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 50)
                                .background(.white)
                                .cornerRadius(8)
                                .padding(.bottom)
                                
                        }
                    }
                    .background(.gray)
                    .cornerRadius(8)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: MapView(), label: {
                    Image(systemName: "globe.asia.australia.fill")
                        .foregroundColor(.primary)
                })

            }
        }
        
    }
}

struct AquariumGameView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGameView(levelId: 0)
    }
}
