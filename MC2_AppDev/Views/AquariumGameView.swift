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
    
    @State var isEdit = false
    @State var isAquariumClicked = false
    @State var aquariumId = 0
    
    @State var isSmallerClicked = false
    
    
    
    
    
    var body: some View {
        NavigationStack{
            
            //            VStack {
            //                DraggableIcon()
            //            }
            
            ZStack{
                VStack{
                    HStack{
                        NavigationLink(destination: MapView(), label: {
                            Image(systemName: "globe.asia.australia.fill")
                                .foregroundColor(.primary)
                        })
                        Spacer()
                        Button {
                            isEdit.toggle()
                            if isAquariumClicked == true {
                                isAquariumClicked = false
                            }
                        } label: {
                            if isEdit == false {
                                Image(systemName: "pencil")
                                    .foregroundColor(.primary)
                            } else {
                                Image(systemName: "fish.fill")
                                    .foregroundColor(.primary)
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 40)
                    
                    
                    VStack{
                        if isEdit == true {
                            Button {
                                isAquariumClicked = true
                            } label: {
                                if isSmallerClicked == true {
                                    SmallAquarium()
                                } else {
                                    LargeAquarium()
                                }
                                
                            }
                            .onChange(of: isAquariumClicked){ newValue in
                                aquariumId = 1
                            }
                            
                            
                            
                        } else {
                            if isSmallerClicked == true {
                                SmallAquarium()
                            } else {
                                LargeAquarium()
                            }
                        }
                        
                        
                        Button{
                            
                        } label: {
                            VStack{
                                Image(systemName: "plus.app.fill")
                                    .font(.system(size: 60))
                                Text("Add")
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(.gray)
                            .foregroundColor(.primary)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                    VStack{
                        if isEdit == true {
                            VStack{
                                HStack{
                                    Spacer()
                                    VStack{
                                        Button{
                                            
                                        } label: {
                                            Image(systemName: "lightbulb.circle.fill")
                                                .font(.system(size: 40))
                                                .foregroundColor(.primary)
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                    
                                }
                                
                                if isAquariumClicked == true {
                                    Text("Edit Mode (Aquarium \(aquariumId))")
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(.green)
                                        .padding(.bottom, -10)
                                } else {
                                    Text("Edit Mode")
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(.green)
                                        .padding(.bottom, -10)
                                }
                                
                            }
                            
                        }
                        
                        if isEdit == true {
                            VStack{
                                if isAquariumClicked == true {
//                                    Text("Aquarium \(aquariumId)")
                                    HStack{
                                        Spacer()
                                        Button {
                                            
                                        } label: {
                                            ZStack{
                                                Image(systemName: "circle.fill")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 50))
                                                Image(systemName: "trash.fill")
                                                    .foregroundColor(.primary)
                                                    .font(.title2)
                                                
                                            }
                                             
                                        }
                                        Spacer()
                                        Button {
                                            isSmallerClicked.toggle()
                                        } label: {
                                            ZStack{
                                                Image(systemName: "circle.fill")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 50))
                                                Image(systemName: "pip.swap")
                                                    .foregroundColor(.primary)
                                                    .font(.title2)
                                            }
                                            
                                        }
                                        .onChange(of: isSmallerClicked){ newValue in
                                            isSmallerClicked.toggle()
                                            
                                            
                                        }
                                        Spacer()
                                        
                                        
                                    }
                                } else {
                                    Text("No fish tank selected.")
                                        .fontWeight(.bold)
                                }
                            }
                            .padding(.horizontal)
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .background(.gray)
                        } else {
                            VStack{
                                HStack{
                                    Spacer()
                                    VStack{
                                        Button{
                                            
                                        } label: {
                                            Image(systemName: "lightbulb.circle.fill")
                                                .font(.system(size: 40))
                                                .foregroundColor(.primary)
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                    
                                }
                                HStack{
                                    Image(systemName: "circle")
                                        .font(.system(size: 60))
                                    Image(systemName: "circle")
                                        .font(.system(size: 60))
                                    Image(systemName: "circle")
                                        .font(.system(size: 60))
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .frame(height: 100)
                                .frame(maxWidth: .infinity)
                                .background(.gray)
                            }
                            
                        }
                    }
                }
                
                if showText == true {
                    ZStack{
                        Text("")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.black.opacity(0.5))
                        VStack{
                            AquariumGame_PopUpView(levelId: levelId)
                                .frame(maxWidth: 250)
                                .padding(.horizontal)
                                .padding(.top)
                            
                            Button{
                                showText = false
                            } label: {
                                Text("Start Game")
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 50)
                                    .background(.gray)
                                    .cornerRadius(8)
                            }
                            .padding(.vertical)
                        }
                        .background(.white)
                        .cornerRadius(8)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AquariumGameView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGameView(levelId: 0)
    }
}
