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
    
    @State var naration1 = level1_part1
    @State var naration1_count = 0
    
    @State var naration2 = level1_part3
    @State var naration2_count = 0
    
    @State var naration3 = level1_part5
    @State var naration3_count = 0
    
    @State var naration4 = level1_part7
    @State var naration4_count = 0
    
    @State var michelleDialogue1 = level1_part2
    @State var michelleDialogue1_count = 0
    
    @State var michelleDialogue2 = level1_part6
    @State var michelleDialogue2_count = 0
    
    @State var salesPersonDialogue1 = level1_part4
    @State var salesPersonDialogue1_count = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                if levelId == 1 {
                    Level1View()
                    Level1Dialogues()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func Level1Dialogues() -> some View {
        ZStack{
            if naration1_count < naration1.count {
                Button{
                    naration1_count = naration1_count + 1
                } label: {
                    Text("\(naration1[naration1_count])")
                        .foregroundColor(.black)
                        .padding(.horizontal, 50)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(.white)
                .opacity(0.9)
            } else {
                if michelleDialogue1_count < michelleDialogue1.count {
                    Button {
                        michelleDialogue1_count = michelleDialogue1_count + 1
                    } label: {
                        ZStack{
                            Image("chat_left")
                                .resizable()
                                .scaledToFit()
                            Text("\(michelleDialogue1[michelleDialogue1_count])")
                                .foregroundColor(.black)
                                .padding(.bottom, 40)
                                .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 600)
                        .padding(.horizontal, 50)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                } else {
                    if naration2_count < naration2.count {
                        Button{
                            naration2_count = naration2_count + 1
                        } label: {
                            Text("\(naration2[naration2_count])")
                                .foregroundColor(.black)
                                .padding(.horizontal, 50)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .background(.white)
                        .opacity(0.9)
                    } else {
                        if salesPersonDialogue1_count < salesPersonDialogue1.count {
                            Button {
                                salesPersonDialogue1_count = salesPersonDialogue1_count + 1
                            } label: {
                                ZStack{
                                    Image("chat_right")
                                        .resizable()
                                        .scaledToFit()
                                    Text("\(salesPersonDialogue1[salesPersonDialogue1_count])")
                                        .foregroundColor(.black)
                                        .padding(.bottom, 40)
                                        .padding(.horizontal, 20)
                                }
                                .padding(.top, 200)
                                .padding(.horizontal, 50)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                        } else {
                            if naration3_count < naration3.count {
                                Button{
                                    naration3_count = naration3_count + 1
                                } label: {
                                    Text("\(naration3[naration3_count])")
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 50)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                .background(.white)
                                .opacity(0.9)
                            } else {
                                if michelleDialogue2_count < michelleDialogue2.count {
                                    Button {
                                        michelleDialogue2_count = michelleDialogue2_count + 1
                                    } label: {
                                        ZStack{
                                            Image("chat_left")
                                                .resizable()
                                                .scaledToFit()
                                            Text("\(michelleDialogue2[michelleDialogue2_count])")
                                                .foregroundColor(.black)
                                                .padding(.bottom, 40)
                                                .padding(.horizontal, 20)
                                        }
                                        .padding(.bottom, 600)
                                        .padding(.horizontal, 50)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        
                                    }
                                } else {
                                    if naration4_count < naration4.count {
                                        Button{
                                            if naration4_count == naration4.count - 1 {
                                                
                                            } else {
                                                naration4_count = naration4_count + 1
                                            }
                                            
                                        } label: {
                                            if naration4_count == naration4.count - 1 {
                                                VStack{
                                                    Text("\(naration4[naration4_count])\n")
                                                        .foregroundColor(.black)
                                                        .padding(.horizontal, 50)
                                                    
                                                    NavigationLink(destination: AquariumGameView(levelId: levelId, hintCount: hintCount), label: {
                                                        Text("Alright! I got it!")
                                                            .foregroundColor(.primary)
                                                            .padding(.vertical, 8)
                                                            .padding(.horizontal, 50)
                                                            .background(.gray)
                                                            .cornerRadius(8)
                                                    })
                                                }
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                
                                            } else {
                                                Text("\(naration4[naration4_count])")
                                                    .foregroundColor(.black)
                                                    .padding(.horizontal, 50)
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            }
                                            
                                        }
                                        .background(.white)
                                        .opacity(0.9)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
    }
    
    func Level1View() -> some View {
        ZStack{
            Image("bg_storyline_ruangtamu")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            HStack{
                Image("char_smiling")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                Spacer()
            }
            .padding(.bottom, 70)
            
            Image("bg_storyline_air")
                .resizable()
                .ignoresSafeArea()
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
            
            
        }
        
    }
}

struct InLevel_StorylineView_Previews: PreviewProvider {
    static var previews: some View {
        InLevel_StorylineView(levelId: 0, hintCount: 0)
    }
}
