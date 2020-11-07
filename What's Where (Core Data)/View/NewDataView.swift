//
//  NewDataView.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-10-27.
//

import SwiftUI

struct NewDataView: View {
    @State private var text1 = ""
    @State private var text2 = ""
    @State var imageData : Data = .init(capacity:0)
    @State var show = false
    @State var imagepicker = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    
   @ObservedObject var homeData : HomeViewModel
  
    @Environment(\.managedObjectContext) var context //this matches a variable in persistence file
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                
                // zstack lets you have overlapping content
               
                    
            /*
                    
                   NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source),isActive: $imagepicker) {
                        
                        Text(" ")
                        
                        
                        
                    }
                    
                    
           */
                
               /*
                Color.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                
                
                NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source),isActive: $imagepicker) {
                    
                    Text(" ")
                    
                    
                    
                }
 
 */
                ZStack {
                    
                    Color.backgroundColor
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    
                    NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source),isActive: $imagepicker) {
                        
                        Text(" ")
                        
                        
                        
                    }
                    
                    VStack{
                    
                    VStack {
                        
                        HStack {
                           
                            
                            
                        
                        // Back button
                        Button(action: {}) {
                            Image("backButton")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 100)
                                .cornerRadius(40)
                             //   .padding(.top,-55)
                                .offset(x:0)
                        }
                            
                            // Add Item Text
                            Text("Add Item").fontWeight(.bold)
                                .frame(width: 260, height: 20)
                                .font(Font.system(size: 25, design: .default))
                                .offset(x:40)
                              //  .padding(.top,-40)
                            
                            
                            
                            
                            
                        }
                       
                        
                        HStack {
                            
                            // Where selected Image appears
                            if imageData.count != 0 {
                                
                                Image(uiImage: UIImage(data: self.imageData)!)
                                
                                    .resizable()
                                        .scaledToFill()
                                        .frame(height: 200)
                                        .clipped()
                                        .listRowInsets(EdgeInsets())
                                    .offset(y:20)
                                    
                                   
                                    
                                    
                                    /*
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
                                
                                   .frame(width:450, height:200)
     
                              */
                                
                            }
                        }
                        
                    
                        
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
                        
                        
                        // Item Name textField
                        TextField("Item Name", text: $homeData.content)
                            
                            .padding(.all, 20)
                            .background(Color(red: 0.52, green: 0.55, blue: 0.58, opacity: 0.3))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(Font.system(size: 25, design: .default))
                        

                            
                          
                        
                        // Item Location TextField
                        TextField("Item Location", text: $homeData.location)
                            
                            .padding(.all, 20)
                           
                            .background(Color(red: 0.52, green: 0.55, blue: 0.58, opacity: 0.3))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(Font.system(size: 25, design: .default))
                        
                        
                        //Add Item Button
                        Button(action: {homeData.writeData(context: context) }, label: {
                            Text("Add Item")
                                .font(Font.system(size: 40, design: .default))
                                .padding()
                                .frame(width:250, height:75)
                                .foregroundColor(.white)
                                .background(Color.addItemColor)
                                .cornerRadius(50)
                        })
                        
                        .padding()
                        .disabled(homeData.content == " " ? true : false)
                        .opacity(homeData.content == " " ? 0.5 : 1)
                    }
                       //Upload Image/ Take Image Option appears
                    }.navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                
                    .actionSheet(isPresented: $show) {
                        
                        ActionSheet(title: Text(""), message: Text (""), buttons: [.default(Text("Upload"), action: {
                            
                            self.source = .photoLibrary
                            self.imagepicker.toggle()
                        }), .default(Text("Take a Picture"), action: {
                            
                            self.source = .camera
                            self.imagepicker.toggle()
                        })])
                    }
                
                }
                
            //        .actionSheet(isPresented: $show) {
                
                   /*
                        ActionSheet(title: Text(""), message: Text (""), buttons: [.default(Text("Upload"), action: {
                            
                            self.source = .photoLibrary
                            self.imagepicker.toggle()
                        }), .default(Text("Take a Picture"), action: {
                            
                            self.source = .camera
                            self.imagepicker.toggle()
                        })])
                    }
                }
                
            */
            
            
           
        }
            
            //disabling button when no data
            
        /*
            TextEditor(text: $homeData.content)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack{
                
                Text("When")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
        }
        
        .background(Color.black.opacity(0.06))
        
       
    }
 */
}
    }
    
    struct Imagepicker: UIViewControllerRepresentable {
        
        func makeCoordinator() -> Imagepicker.Coordinator {
           
            return Imagepicker.Coordinator(parent1: self)
        }
        
        @Binding var show : Bool
        @Binding var image : Data
        var source : UIImagePickerController.SourceType
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<Imagepicker>) -> UIImagePickerController {
            
            let controller = UIImagePickerController()
            controller.sourceType = source
            controller.delegate = context.coordinator
            return controller
            
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<Imagepicker>) {
            
        }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var parent : Imagepicker
        init(parent1 : Imagepicker) {
            
            parent = parent1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let data = image.pngData()
            self.parent.image = data!
            self.parent.show.toggle()
        }
    }
}


}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
