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
                Image("bg_contentview")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    Image("logo_aquatic_academia")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 40)
                        .padding(.bottom, 100)
                    
                    NavigationLink(destination: MapView(), label: {
                        Image("tombol_play")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 130)
                    })
                }
                .padding(.bottom, 200)
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
