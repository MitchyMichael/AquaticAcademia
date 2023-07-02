//
//  FishData.swift
//  MC2_AppDev
//
//  Created by Anna Bella Atmadjaja on 30/06/23.
//

import Foundation
import CoreData

class FishData: ObservableObject {
    static let shared = FishData()
    let container = NSPersistentContainer(name: "ModelData")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
        
        func save(context: NSManagedObjectContext) {
            do {
                try context.save()
                print("Data Saved")
            } catch {
                print("We could not save the data...")
            }
        }
        
        func seedGlossary() {
            let context = container.viewContext
            
            let neon_tetra = FishGlossary(context:context)
            neon_tetra.latin_name = "Paracheirodon innesi"
            neon_tetra.english_name = "Neon Tetra"
            neon_tetra.colony = "School"
            neon_tetra.environment = "Medium sized, Large sized"
            neon_tetra.temperament = "Peacefull"
            neon_tetra.diet = "Ominivore"
            neon_tetra.compatibility = "Guppy, Platy, Molly"
            neon_tetra.incompatibility = "Betta, Tiger Barb, Cichlids"
        }
    }
}
