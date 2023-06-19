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
        ZStack{
            VStack{
                VStack{
                    Text("Ikan Naga Indosiar")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    HStack{
                        Spacer()
                        Image(systemName: "arrowshape.backward.fill")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("")
                            .frame(width: 150, height: 150)
                            .background(.gray)
                            .cornerRadius(8)
                        Spacer()
                        Image(systemName: "arrowshape.forward.fill")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    
                    VStack{
                        HStack{
                            Text("Description \n")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        Text("Food: Small fish, plankton \n\nHabitat: Sea water \n\nPersonality: Loner, Aggresive \n\nUnique story: \nThis fish able to survive 3 days without food by eating small plankton on the water.")
                    }
                    .padding(.bottom, 80)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray)
                    .cornerRadius(8)
                    .padding()
                    
                }
                Spacer()
            }
            
            VStack{
                Spacer()
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "x.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                        .padding()
                }
                
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
