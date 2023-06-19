//
//  ContentView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Text("Logo")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .padding(.bottom, 90)
                VStack{
                    Spacer()
                    NavigationLink(destination: MapView(), label: {
                            Text("Play")
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(.gray)
                                .cornerRadius(5)
                                .padding(.horizontal, 50)
                                .padding(.bottom, 60)
                                .foregroundColor(.primary)
                    })
                }
               
            }
            
        }
        .preferredColorScheme(.light)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
