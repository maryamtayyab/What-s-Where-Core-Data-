//
//  SenderView.swift
//  imagePickerCoreData- test
//
//  Created by Maryam TayyabII on 2020-11-09.
//
//Start
import SwiftUI

struct SenderView: View {
    // I only neeed this moc here to send all the info to the main view
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var userDefaults = UserDefaults.standard.persistentDomain(forName: "Saving")
    
    @State var image : Data = .init(count: 0)
    
    @State var show = false
    
    @State var name = ""
    
    @State var location = ""
    
  
    var body: some View {
        NavigationView {
        VStack {
            if self.image.count != 0 {
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(uiImage: UIImage(data: self.image)!)
                        .renderingMode(.original)
                    .resizable()
                        .frame(width: 100, height: 100)
                    .cornerRadius(6)
                    
                }
            } else {
                Button(action: {
                    self.show.toggle()
                    
                }) {
                    // Camera Icon Image
                    Image("cameraIconGrey")
                        
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .scaledToFit()
                        .cornerRadius(40)
                        .shadow(radius: 5)
                    //   .background(Color.backgroundColor)
                   //    .foregroundColor(Color.backgroundColor)
                       .padding(.all,20)
                }
            }
            
            TextField("location...", text: self.$location)
            .padding()
                .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
            .cornerRadius(20)
            
            
            TextField("name...", text: self.$name)
            .padding()
                .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
            .cornerRadius(20)
            
           
            Button(action: {
              
                let send = Saving(context: self.moc)
                send.name = self.name
                send.location = self.location
                send.imageD = self.image
               
                
                try? self.moc.save()
                self.presentationMode.wrappedValue.dismiss()
                self.name = ""
                self.location = ""
                
                
            }) {
                Text("Add Item")
                    .fixedSize()
                    .frame(width: 250, height: 30)
                    .foregroundColor((self.name.count > 0 && self.location.count > 0 && self.image.count > 0) ? Color.white : Color.black)
               
                .background((self.name.count > 0 && self.location.count > 0 && self.image.count > 0) ? Color.blue : Color.gray)
                .cornerRadius(13)
            }.animation(.default)
           
        }.navigationBarItems(trailing: Button(action: { self.presentationMode.wrappedValue.dismiss()}) {
            Text("Cancel")
            
        })
        }
        
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        }).animation(.default)
    
    }
}

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView()
    }
}
