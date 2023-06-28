//
//  MapView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 14/06/23.
//

import SwiftUI

struct MapView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var levelId = 0
    @State var thisLevelReward = 0
    
    @State var isLevelClicked = false
    @State var showDecisionGameView = false
    
    @State var hintCount = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView {
                    ZStack{
                        Image("bg_map")
                            .resizable()
                            .scaledToFit()
                        
                        VStack{
                            // Level 1
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 1, hintCount: 3), label: {
                                    Image("btn_lvl1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 110)
                                })
                            }
                            .padding(.top, 230)
                            .padding(.trailing, 100)
                            
                            //Level 2
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 2, hintCount: 2), label: {
                                    Image("btn_lvl2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                })
                            }
                            .padding(.top, 60)
                            .padding(.trailing, 170)
                            
                            // Level 3
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 3, hintCount: 2), label: {
                                    Image("btn_lvl3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                })
                            }
                            .padding(.top, 70)
                            .padding(.trailing, 20)
                            
                            // Level 4
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 4, hintCount: 1), label: {
                                    Image("btn_lvl4")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                })
                            }
                            .padding(.top, 70)
                            .padding(.leading, 80)
                            
                            // Level 5
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 5, hintCount: 0), label: {
                                    Image("btn_lvl5")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150)
                                })
                            }
                            .padding(.top, 70)
                            .padding(.trailing, 160)
                            
                            // Level 6
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 6, hintCount: 0), label: {
                                    Image("btn_lvl6")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                })
                            }
                            .padding(.top, 60)
                            .padding(.trailing, 200)
                            
                            // Level 7
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 7, hintCount: 0), label: {
                                    Image("btn_lvl7")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                })
                            }
                            .padding(.top, 70)
                            .padding(.trailing, 50)
                            
                            // Level 8
                            VStack{
                                NavigationLink(destination: InLevel_DescriptionView(levelId: 8, hintCount: 0), label: {
                                    Image("btn_lvl8")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                })
                            }
                            .padding(.top, 70)
                            .padding(.leading, 80)
                            
                            Spacer()
                        }
                    }
                    
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea()
                
                VStack{
                    HStack(alignment: .top){
                        Spacer()
                        VStack{
                            NavigationLink(destination: CollectionView(), label: {
                                Image("btn_collection")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                            })
                        }
                        .padding(.top, 80)
                    }
                    .font(.title2)
                    .padding()
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
            }
            //            .background(.blue)
        }
        
        
    }
    
    
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
