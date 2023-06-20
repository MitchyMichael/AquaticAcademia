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
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView {
                    LazyVStack(spacing: 20) {
                        Text("Logo")
                            .font(.system(size: 60))
                            .fontWeight(.bold)
                            .padding(.bottom, 90)
                        
                        
                        HStack(alignment: .top){
                            // Level 1
                            VStack{
                                Button{
                                    levelId = 1
                                    thisLevelReward = 100
                                    print(levelId)
                                    isLevelClicked = true
                                } label: {
                                    Text("1")
                                        .frame(width: 50, height: 50)
                                        .background(.gray)
                                        .cornerRadius(50)
                                        .foregroundColor(.primary)
                                        .padding(.trailing, 50)
                                    
                                }
                                .sheet(isPresented: $isLevelClicked){
                                    InMapPopUp(thisLevelId: self.$levelId, thisLevelReward: $thisLevelReward, showNext: $showDecisionGameView)
                                        .padding(.horizontal)
                                        .presentationDetents([.height(200), .medium, .large])
                                        .presentationDragIndicator(.automatic)
                                }
                                .background(
                                    NavigationLink(destination: DecisionGameView(), isActive: $showDecisionGameView) {
                                        EmptyView()
                                    }
                                )
                            }
                            
                            // Level 2
                            VStack{
                                Button{
                                    levelId = 2
                                    thisLevelReward = 200
                                    print(levelId)
                                    isLevelClicked = true
                                    
                                } label: {
                                    Text("2")
                                        .frame(width: 50, height: 50)
                                        .background(.gray)
                                        .cornerRadius(50)
                                        .foregroundColor(.primary)
                                    
                                    
                                    
                                }
                            }
                            .padding(.top, 40)
                            
                            
                            // Level 3
                            VStack{
                                Button{
                                    levelId = 3
                                    thisLevelReward = 300
                                    print(levelId)
                                    isLevelClicked = true
                                    
                                } label: {
                                    Text("3")
                                        .frame(width: 50, height: 50)
                                        .background(.gray)
                                        .cornerRadius(50)
                                        .foregroundColor(.primary)
                                    
                                        .padding(.leading, 50)
                                    
                                }
                            }
                            .padding(.top, 140)
                            
                        }
                        .frame(maxWidth: .infinity)
                        //                        .background(.cyan)
                        
                        HStack(alignment: .top){
                            // Level 5
                            VStack{
                                Button{
                                    levelId = 5
                                    print(levelId)
                                    thisLevelReward = 500
                                    isLevelClicked = true
                                    
                                } label: {
                                    Text("5")
                                        .frame(width: 50, height: 50)
                                        .background(.gray)
                                        .cornerRadius(50)
                                        .foregroundColor(.primary)
                                        .padding(.trailing, 20)
                                    
                                    
                                }
                            }
                            .padding(.top, 120)
                            
                            
                            // Level 4
                            VStack{
                                Button{
                                    levelId = 4
                                    print(levelId)
                                    thisLevelReward = 400
                                    isLevelClicked = true
                                    
                                } label: {
                                    Text("4")
                                        .frame(width: 50, height: 50)
                                        .background(.gray)
                                        .cornerRadius(50)
                                        .foregroundColor(.primary)
                                        .padding(.trailing, 90)
                                    
                                    
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        //                        .background(.cyan)
                    }
                    .padding(.top, 200)
                }
                
                
                VStack{
                    HStack(alignment: .top){
                        NavigationLink(destination: ShopView(), label: {
                            ZStack{
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(.gray)
                                Image(systemName: "cart")
                            }
                            .foregroundColor(.primary)
                        })
                        Spacer()
                        ZStack{
                            Text("$ 3800")
                                .padding(.vertical, 10)
                                .padding(.horizontal, 26)
                                .background(.gray)
                                .cornerRadius(5)
                                .padding(.top, 5)
                            
                        }
                        VStack{
                            NavigationLink(destination: CollectionView(), label: {
                                ZStack{
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.gray)
                                    Image(systemName: "book")
                                }
                                .foregroundColor(.primary)
                                .padding(.bottom, 5)
                            })
                            
                            
                            NavigationLink(destination: AquariumView(), label: {
                                ZStack{
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.gray)
                                    Image(systemName: "fish")
                                }
                                .foregroundColor(.primary)
                            })
                            
                            
                        }
                    }
                    .font(.title2)
                    .padding()
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                
                
                
            }
        }
        
    }
    
    
}

struct InMapPopUp: View {
    
    @Binding var thisLevelId: Int
    @Binding var thisLevelReward: Int
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNext: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                HStack{
                    Text("Level \(thisLevelId)")
                    Spacer()
                }
                
                HStack{
                    Text("Rewards:")
                        .fontWeight(.bold)
                    Spacer()
                    Text("$ \(thisLevelReward) (+100 First Time)")
                }
                Spacer()
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    DispatchQueue.main.async {
                        self.showNext = true
                    }
                } label: {
                    Text("Start Game")
                        .fontWeight(.bold)
                        .frame(width: 300)
                        .padding(.vertical)
                        .foregroundColor(.primary)
                        .background(.gray)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
