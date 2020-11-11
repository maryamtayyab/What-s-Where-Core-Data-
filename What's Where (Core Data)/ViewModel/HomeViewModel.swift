//
//  HomeViewModel.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-10-27.
//
/*
import SwiftUI
import CoreData
class HomeViewModel : ObservableObject {
    
    @Published var content = " "    // Item Name var
    @Published var location = " "           //Item location var
   
   // @Published var image: bin
    
    @Published var image : Data = .init(capacity:0)
    
    @Published var isNewData = false
  //  @Published var image: Image?
    
    
   
      @State private var showImagePicker = false
      @State private var inputImage: UIImage?
    
    
    
    
    //writeData function
       
    func writeData(context: NSManagedObjectContext) {
        
        
        let newItem = Item(context: context)     // Item is the entity we created
        newItem.content = content                //Item name
        newItem.location = location              //Item location
        newItem.image = image                    //Item image
        
        
     
        
        
        
        
        // saving data
      //  var item = NSEntityDescription.insertNewObject(forEntityName: "item", into: context) as! Item

      //  item.= imageData
        
        
        do {
            try context.save()
            //success means closing view
            isNewData.toggle()
        }
        
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    func save() {
        
     //  let savedImage = inputImage?.jpegData(compressionQuality: 1.0)
    

        //    try? self.moc.save()
            print("Image is saved")
         }
    
   // func loadImage() {
     //      guard let inputImage = inputImage else { return }
         //  image = Image(uiImage: inputImage)
     //  }
    
    
    
}

 */
