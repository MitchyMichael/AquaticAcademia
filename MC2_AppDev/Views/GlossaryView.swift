import SwiftUI

struct GlossaryView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    // hardcoded variables
    @State var fishName = "Naga indosiar"
    @State var fishColonies = ["person.3.fill", "person.3.sequence.fill"]
    @State var fishEnvironments = ["snowflake.slash", "humidity.fill", "fish.circle.fill"]
    @State var fishTemperaments = ["mug.fill", "sun.max.fill", "moon.fill"]
    @State var fishDiets = ["tree.fill", "fish"]
    @State var fishCompatibles = ["cloud.snow.fill", "fish.fill"]
    @State var fishIncompatibles = ["aqi.high", "thermometer.high", "carbon.dioxide.cloud.fill"]
    
    var body: some View {
        ZStack{
            Text("Asset buku")
            
            VStack{
                HStack{
                    Spacer()
                    
                        Button {
                            dismiss()
                        } label: {
                            Image("btn_x_red")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                        }.padding(.trailing)
                    
//                    Button{
//                        // Button action
//                    } label: {
//                        Image(systemName: "xmark").foregroundColor(.primary).frame(width: 40, height: 40,alignment: .center).background(.red)
//                    }
//                    Spacer().frame(width: 16)
                }
                
                VStack{
                    HStack{
                        Spacer()
                        Text(fishName)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    Spacer().frame(width: 330, height: 165).background(.green).padding(4)
                    
                    Grid (verticalSpacing: 8){
                        
                        // Column Name
                        GridRow {
                            HStack{
                                Text("Colony")
                                Spacer()
                                
                            }
                            
                            HStack{
                                Text("Environment")
                                Spacer()
                                
                            }
                        }
                        
                        // Column Item (Max 3 items)
                        GridRow {
                            HStack{
                                ForEach(fishColonies.indices, id: \.self){
                                    Image(systemName: fishColonies[$0]).frame(width: 40, height: 40) .padding(2).background(.white)
                                    
                                    // Alternate code for empty frame in grid
                                    //Spacer().frame(width: 40, height: 40).padding(2).background(.clear)
                                }
                                Spacer()
                            }
                            
                            
                            HStack{
                                ForEach(fishEnvironments.indices, id: \.self){
                                    Image(systemName: fishEnvironments[$0]).frame(width: 40, height: 40) .padding(2).background(.white)
                                }
                                Spacer()
                            }
                        }
                        .padding(.bottom, 10)
                        
                        // Column Name
                        GridRow {
                            HStack{
                                Text("Temperament")
                                Spacer()
                                
                            }
                            HStack{
                                Text("Diet")
                                Spacer()
                                
                            }
                        }
                        
                        // Column Item (Max 3 items)
                        GridRow {
                            HStack{
                                ForEach(fishTemperaments.indices, id: \.self){
                                    Image(systemName: fishTemperaments[$0]).frame(width: 40, height: 40) .padding(2).background(.white)
                                }
                                Spacer().background(.pink)
                            }
                            
                            HStack{
                                ForEach(fishDiets.indices, id: \.self){
                                    Image(systemName: fishDiets[$0]).frame(width: 40, height: 40) .padding(2).background(.white)
                                }
                                Spacer().background(.pink)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        // Column Name
                        GridRow {
                            HStack{
                                Text("Likely compatible with")
                                Spacer()
                            }.gridCellColumns(2)
                        }
                        
                        // Column Item (Max 6 items)
                        GridRow {
                            HStack{
                                ForEach(fishCompatibles.indices, id: \.self){
                                    Image(systemName: fishCompatibles[$0]).frame(width: 40, height: 40) .padding(2).background(.white)
                                }
                                Spacer()
                            }.gridCellColumns(2)
                        }
                        .padding(.bottom, 10)
                        
                        // Column Name
                        GridRow {
                            HStack{
                                Text("Likely incompatible with")
                                Spacer()
                            }.gridCellColumns(2)
                        }
                        
                        // Column Item (Max 6 items)
                        GridRow {
                            HStack{
                                ForEach(fishIncompatibles.indices, id: \.self){
                                    Image(systemName: fishIncompatibles[$0]).frame(width: 40, height: 40) .padding(2).background(.white)
                                }
                                Spacer()
                            }.gridCellColumns(2)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    
                }
                .padding(.bottom, 20)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray)
                .cornerRadius(8)
                .padding(.horizontal, 16)
                
                HStack{
                    Spacer().frame(width: 16)
                    Button{
                        // Button action
                    } label: {
                        Image(systemName: "arrowshape.turn.up.left.fill").foregroundColor(.primary).frame(width: 40, height: 40,alignment: .center)
                    }
                    Spacer()
                    Button{
                        // Button action
                    } label: {
                        Image(systemName: "list.clipboard.fill").foregroundColor(.primary).frame(width: 40, height: 40,alignment: .center)
                    }
                    Spacer()
                    
                    Button{
                        // Button action
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right.fill").foregroundColor(.primary).frame(width: 40, height: 40,alignment: .center)
                    }
                    Spacer().frame(width: 16)
                }
                
            }
        }
    }
}

struct GlossaryView_Previews: PreviewProvider {
    static var previews: some View {
        GlossaryView()
    }
}
