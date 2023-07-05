//
//  AquariumGameView.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 22/06/23.
//

import SwiftUI

struct AquariumGameView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showObjectives = true
    @State private var showHint = false
    
    @State private var circleDragset1 = CGSize.zero
    @State private var circleDragset2 = CGSize.zero
    @State private var circleDragset3 = CGSize.zero
    
    @State var levelId: Int
    
    @State var isEdit = false
    @State var isAquariumClicked = false
    @State var aquariumId = 0
    
    @State var isSmallerClicked = false
    
    @State var hintCount: Int
    
    var body: some View {
        NavigationStack{
            
            //            VStack {
            //                DraggableIcon()
            //            }
            
            ZStack{
                VStack{
                    HStack{
                        // === Map Navigation Button
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
                        // === If in edit mode - Aquarium size
                        if isEdit == true {
                            HStack{
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
                                //                                .background(.blue)
                                if isSmallerClicked == true{
                                    Spacer()
                                }
                                
                            }
                            
                            // === If not in edit mode - Aquarium size
                        } else {
                            HStack{
                                if isSmallerClicked == true {
                                    SmallAquarium()
                                } else {
                                    LargeAquarium()
                                }
                                
                                if isSmallerClicked == true{
                                    Spacer()
                                }
                            }
                            
                        }
                        
                        // === Add aquarium button
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
                            // === If in edit mode - Aquarium ID indicator text view (green background)
                            VStack{
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
                        
                        // === If in edit mode
                        if isEdit == true {
                            VStack{
                                // === If aquarium clicked, then show action button
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
                            
                            // === If not in edit mode
                        } else {
                            VStack{
                                HStack{
                                    Spacer()
                                    VStack{
                                        
                                        // === Objectives button
                                        Button{
                                            showObjectives = true
                                        } label: {
                                            VStack{
                                                Image(systemName: "lightbulb.circle.fill")
                                                    .font(.system(size: 40))
                                                    .foregroundColor(.primary)
                                            }
                                            
                                        }
                                        
                                        Text("Objectives")
                                            .font(.caption)
                                    }
                                    .padding(.horizontal)
                                }
                                
                                // Future fish drag and drop location
                                HStack{
                                    ZStack{
                                        Image(systemName: "circle")
                                            .font(.system(size: 60))
                                        Image(systemName: "circle")
                                            .font(.system(size: 60))
                                            .offset(x: circleDragset1.width, y: circleDragset1.height)
                                            .gesture(DragGesture()
                                                .onChanged { gesture in
                                                    let screenWidth = UIScreen.main.bounds.width
                                                    let minOffset = -screenWidth
                                                    let maxOffset = screenWidth
                                                    let screenHeight = UIScreen.main.bounds.height
                                                    let minOffsetHeight = -screenHeight
                                                    let maxOffsetHeight = screenHeight
                                                    
                                                    circleDragset1 = CGSize(width: min(max(gesture.translation.width, minOffset), maxOffset), height: min(max(gesture.translation.height, minOffsetHeight), maxOffsetHeight))
                                                }
                                                .onEnded { _ in
                                                    circleDragset1 = .zero
                                                }
                                            )
                                    }
                                    ZStack{
                                        Image(systemName: "circle")
                                            .font(.system(size: 60))
                                        Image(systemName: "circle")
                                            .font(.system(size: 60))
                                            .offset(x: circleDragset2.width, y: circleDragset2.height)
                                            .gesture(DragGesture()
                                                .onChanged { gesture in
                                                    let screenWidth = UIScreen.main.bounds.width
                                                    let minOffset = -screenWidth
                                                    let maxOffset = screenWidth
                                                    let screenHeight = UIScreen.main.bounds.height
                                                    let minOffsetHeight = -screenHeight
                                                    let maxOffsetHeight = screenHeight
                                                    
                                                    circleDragset2 = CGSize(width: min(max(gesture.translation.width, minOffset), maxOffset), height: min(max(gesture.translation.height, minOffsetHeight), maxOffsetHeight))
                                                }
                                                .onEnded { _ in
                                                    circleDragset2 = .zero
                                                }
                                            )
                                    }
                                    ZStack{
                                        Image(systemName: "circle")
                                            .font(.system(size: 60))
                                        Image(systemName: "circle")
                                            .font(.system(size: 60))
                                            .offset(x: circleDragset3.width, y: circleDragset3.height)
                                            .gesture(DragGesture()
                                                .onChanged { gesture in
                                                    let screenWidth = UIScreen.main.bounds.width
                                                    let minOffset = -screenWidth
                                                    let maxOffset = screenWidth
                                                    let screenHeight = UIScreen.main.bounds.height
                                                    let minOffsetHeight = -screenHeight
                                                    let maxOffsetHeight = screenHeight
                                                    
                                                    circleDragset3 = CGSize(width: min(max(gesture.translation.width, minOffset), maxOffset), height: min(max(gesture.translation.height, minOffsetHeight), maxOffsetHeight))
                                                }
                                                .onEnded { _ in
                                                    circleDragset3 = .zero
                                                }
                                            )
                                    }
                                    
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
                
                // Pop up objectives
                if showObjectives == true {
                    popUpObjectives()
                        
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func popUpObjectives() -> some View {
        ZStack{
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .opacity(0.5)
            
            AquariumGame_PopUpView(levelId: levelId)
                .padding(.bottom, 70)
            
            Button{
                showObjectives = false
            } label: {
                Image("btn_start_yellow")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.top, 200)
            .padding(.horizontal, 120)
        }
        
    }
    
}

struct AquariumGameView_Previews: PreviewProvider {
    static var previews: some View {
        AquariumGameView(levelId: 0, hintCount: 0)
    }
}
