//
//  HomeViewModel.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-10-27.
//

import SwiftUI
import CoreData
class HomeViewModel : ObservableObject {
    @Published var content = "Item Name"
    
    @Published var isNewData = false
    
    func writeData(context: NSManagedObjectContext) {
       
        
        
        let newItem = Item(context: context)
        newItem.content = content
        
        // saving data
        
        do {
            try context.save()
            //success means closing view
            isNewData.toggle()
        }
        
        catch{
            print(error.localizedDescription)
        }
        
    }
    
}
