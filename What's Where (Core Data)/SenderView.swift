//
//  SenderView.swift
//  imagePickerCoreData- test
//
//  Created by Maryam TayyabII on 2020-11-09.
//
//Start
import Foundation
import SwiftUI
import Combine

struct SenderView: View {
    // I only neeed this moc here to send all the info to the main view
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var userDefaults = UserDefaults.standard.persistentDomain(forName: "Saving")
    
    @State var image : Data = .init(count: 0)
    
    @State var show = false
    
    @State var name = ""
    
    @State var location = ""
   
    @State var showAction = false
    @State var imagepicker = false
    
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    
    
  
    var body: some View {
        NavigationView {
            ZStack{
                Color.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
           
           /*     NavigationLink(destination: ImagePicker(show: $imagepicker, image: $image, source: source),isActive: $imagepicker) {
                     
                     Text(" ")
 
            */
                        /*
                       .sheet(isPresented: self.$show, content: {
                        ImagePicker(show: self.$show, image: self.$image, source: .photoLibrary)
                       }).animation(.default)
                    
                */
        VStack {
            if self.image.count != 0 {
                Button(action: {
                    self.showAction.toggle()
                }) {
                    if image.count != 0 {
                    Image(uiImage: UIImage(data: self.image)!)
                        .renderingMode(.original)
                    .resizable()
                        .frame(width: 170, height: 150)
                    .cornerRadius(6)
                    }
                    
                }
            } else {
                Button(action: {
                    
                    self.showAction.toggle()
                    
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
            
            TextField("name...", text: self.$name)
           // .padding()
             //   .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
          //  .cornerRadius(20)
            
                .padding(.all, 15)
               
                .background(Color(red: 0.52, green: 0.55, blue: 0.58, opacity: 0.3))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 22, design: .default))
            
            
            TextField("location...", text: self.$location)
          //  .padding()
             //   .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
         //   .cornerRadius(20)
            
                .padding(.all, 15)
                .background(Color(red: 0.52, green: 0.55, blue: 0.58, opacity: 0.3))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 18, design: .default))
              
            
            
        
           
            Button(action: {
              
                let send = Saving(context: self.moc)
                send.names = self.name
                send.locations = self.location
                send.imageD = self.image
               
                
                try? self.moc.save()
                self.presentationMode.wrappedValue.dismiss()
                self.name = ""
                self.location = ""
                
                /* .font(Font.system(size: 40, design: .default))
                 .padding()
                 .frame(width:250, height:75)
                 .foregroundColor(.white)
                 .background(Color.addItemColor)
                 .cornerRadius(50)*/
                
            }) {
                Text("Add Item")
                    .font(Font.system(size: 40, design: .default))
                    .fixedSize()
                    .padding(.all,10)
                    .frame(width: 250, height: 60)
                    .foregroundColor(.white)
                   
                    .foregroundColor((self.name.count > 0 && self.location.count > 0 && self.image.count > 0) ? Color.white : Color.black)
               
                    .background((self.name.count > 0 && self.location.count > 0 && self.image.count > 0) ? Color.addItemColor : Color.addItemColor)
                .cornerRadius(50)
            }.animation(.default)
            .padding()
           
        }
            }
            //.navigationBarTitle("Add Item", displayMode:.inline)
           
            .navigationBarItems(leading:VStack {
                Text("Add Item")
                
            }, trailing:
                HStack{
                    
                  //  Text("Add Item")
                    //    .offset(x:-20)
                    Button(action: { self.presentationMode.wrappedValue.dismiss()}) {
                        Text("Cancel")
                        
                        
                        
                        
                        
                    }
                    
                })
            
             
            .actionSheet(isPresented: $showAction) {
                
                ActionSheet(title: Text("Select Photo"), message: Text ("Select a photo from the library or use the camera"), buttons: [.default(Text("Camera")) {
                    
                    self.source = .camera
                    self.show.toggle()
                    
                },
                
                
            
                .default(Text("photo Library")) {
                   
                    self.source = .photoLibrary
                    self.show.toggle()
                }
                ])
            }
                
            .sheet(isPresented: self.$show) {
                ImagePicker(show:self.$show, image: self.$image, source: self.source)
                
            /*
                action: {
                    
                    self.source = .photoLibrary
                    self.imagepicker.toggle()
                }), .default(Text("Take a Picture"), action: {
                    
                    self.source = .camera
                    self.imagepicker.toggle()
                })])
            } .sheet(isPresented: self.$show) {
                ImagePicker(show:self.$show, image: self.$image, source: self.source)
            }  */
            
        
        
       
              
   //    .sheet(isPresented: self.$show, content: {
     //   ImagePicker(show: self.$show, image: self.$image)
       //}).animation(.default)
    
  //  }


}

    }
}

}

