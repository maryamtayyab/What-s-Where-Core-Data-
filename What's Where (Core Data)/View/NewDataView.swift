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
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                
                // zstack lets you have overlapping content
               
                    
            /*
                    
                   NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source),isActive: $imagepicker) {
                        
                        Text(" ")
                        
                        
                        
                    }
                    
                    
           */
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
                            }
                            
                            
                            // Add Item Text
                            Text("Add Item").fontWeight(.bold)
                                .frame(width: 260, height: 20, alignment: .topTrailing)
                                .font(Font.system(size: 25, design: .default))
                            
                            
                            
                        }
                        
                        // Where selected Image appears
                        if imageData.count != 0 {
                            
                            Image(uiImage: UIImage(data: self.imageData)!).resizable().frame(width:150, height:150).cornerRadius(30)
                            
                        }
                        
                    
                        
                        Button(action: {
                            
                            self.show.toggle()
                            
                            
                        }) {
                           
                            // Camera Icon Image
                            Image("camera")
                                
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 140, height: 110)
                                .cornerRadius(40)
                                .shadow(radius: 5)
                                .background(Color.backgroundColor)
                                .foregroundColor(Color.backgroundColor)
                                .padding(.all,35)
                            
                            
                        }
                        
                        
                        // Item Name textField
                        TextField("Item Name", text: $homeData.content)
                            
                            
                            .padding(.all, 30)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(Font.system(size: 30, design: .default))
                        
                        // Item Location TextField
                        TextField("Item Location", text: $text2)
                            
                            .padding(.all, 30)
                           
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(Font.system(size: 30, design: .default))
                        
                        
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
                        
                       //Upload Image/ Take Image Option appears
                    }.navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
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
            .padding()
            .disabled(homeData.content == " " ? true : false)
            .opacity(homeData.content == " " ? 0.5 : 1)
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
}
