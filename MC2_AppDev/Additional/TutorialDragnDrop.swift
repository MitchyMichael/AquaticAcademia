//
//  ContentView.swift
//  Drag and Drop
//
//  Created by Kristanto Sean on 07/07/23.
//

import SwiftUI

struct AquariumTemp : Identifiable, Hashable {
    var id = UUID()
    var name: String
    var fishes: [String]
}

struct TutorialDragnDrop: View {
    
    @State var aquariums: [AquariumTemp] = [AquariumTemp(name: "Aquarium 1", fishes: ["🐟"])]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                List {
                    ForEach(Array(zip(aquariums.indices, aquariums)), id: \.0) { index, item in
                        VStack {
                            Text(aquariums[index].name)
                            HStack {
                                ForEach(aquariums[index].fishes, id:\.self) { fish in
                                    Text(fish)
                                }
                                Spacer()
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        .padding()
                        .dropDestination(for: String.self) { items, location in
                            aquariums[index].fishes.append(contentsOf: items)
                            return true
                        }
                    }
                }
                .frame(height: geo.size.height/2)
                
                Button {
                    aquariums.append(
                        AquariumTemp(name: "Aquarium \(aquariums.count+1)", fishes: [])
                    )
                } label: {
                    Text("Add Aquarium")
                }
                
                HStack {
                    Text("🐟")
                        .padding()
                        .background(.green)
                        .draggable("🐟") {
                            Text("🐟")
                        }

                    Text("🐠")
                        .padding()
                        .background(.pink)
                        .draggable("🐠")

                    Text("🐡")
                        .padding()
                        .background(.gray)
                        .draggable("🐡")

                }
            }
            
            

        }
    }
}

struct TutorialDragnDrop_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
