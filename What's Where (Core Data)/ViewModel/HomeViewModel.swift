//
//  HomeViewModel.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-10-27.
//

import SwiftUI
import CoreData
class HomeViewModel : ObservableObject {
    
    @Published var content = " "    // Item Name var
    @Published var location = " "           //Item location var
    @Published var isNewData = false
    
    
    
    //writeData function
       
    func writeData(context: NSManagedObjectContext) {
        
        
        let newItem = Item(context: context)     // Item is the entity we created
        newItem.content = content                //Item name
        newItem.location = location              //Item location
        
        
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
