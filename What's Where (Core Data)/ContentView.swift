//
//  ContentView.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-10-27.
//

//
//  ContentView.swift
//  imagePickerCoreData- test
//
//  Created by Maryam TayyabII on 2020-11-09.
//

//Start



//Start
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Saving.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Saving.names, ascending: true),
        NSSortDescriptor(keyPath: \Saving.imageD, ascending: true),
        NSSortDescriptor(keyPath: \Saving.locations, ascending: true)
       ]
    ) var savings : FetchedResults<Saving>
    
    
    
    @State var image : Data = .init(count: 0)
    
    @State var show = false
    
    var count = 0
    
    @State var text = ""
    var body: some View {
        NavigationView {
            ZStack{
                    Color.backgroundColor
                        .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
            
                ForEach(savings, id: \.self) { save in
                VStack(alignment: .leading) {
                   
//                    Button(action: {
//                        moc.delete(save)
//
//                        try! moc.save()
//
//                    },
//                    label: {
//                        Text("Delete")
//                            .font(Font.system(size: 16, design: .default))
//                            .foregroundColor(Color.red)
//
//                    }).offset(x:250)
                    
                    VStack {
                        //put title on screen
                        HStack {
                            Text("\(save.names ?? "")")
                                .offset(x:9)
                                .padding(6)
                                .font(.title2)
                            //  .foregroundColor(.white)
                            //      .background(Color.black)
                            //      .cornerRadius(5)
                            
                            //put location on screen
                            Image("icon")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 25)
                                .scaledToFit()
                            //    .cornerRadius(40)
                                .shadow(radius: 5)
                               
                                .offset(x:16)
                            Text("\(save.locations ?? "")")
                                .lineLimit(4)
                                .font(.subheadline)
                                .padding(2)
                                .offset(x:15)
                                Spacer()
                            
                            //delete button
                            Button(action: {
                                moc.delete(save)
                                
                                try! moc.save()
                                    
                            },
                            label: {
                                Text("Delete")
                                    .font(Font.system(size: 16, design: .default))
                                    .foregroundColor(Color.red)
                                    .offset(x:-8)

                            })
                            
                        }
                        
                        if save.imageD != nil {
//                            Image(uiImage: UIImage(data: save.imageD!)!)
                            let temp = UIImage(data: save.imageD!)
                            
                            if temp != nil {
                                Image(uiImage: temp!)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width - 34, height: 210)
                                    .cornerRadius(15)
                            }
                            else {
                                Image(uiImage: UIImage(systemName: "questionmark")!)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width - 0, height: 0)
                            }
//                            Image(uiImage: temp ?? UIImage(systemName: "circle")!)
//                                .resizable()
//                                .frame(width: UIScreen.main.bounds.width - 34, height: 210)
//                                .cornerRadius(15)
                        }
                        
                        
                        //can create with no image, but can't create with image
                        //crashes when you try to add an image to entry (!=)
                        //doesn't crash using (>), but image still isn't present
                        
//                        if image.count > 0 {
//                            Image(uiImage: UIImage(data: save.imageD ?? self.image)!)
//                                .resizable()
//                                .frame(width: UIScreen.main.bounds.width - 34, height: 210)
//                                .cornerRadius(15)
//                        }
                        
 ////------------------------- //ADD DELETE BUTTON HERE.  (USING VAR MOC).....................................................//
                    
                        
                    }
                    
                        
                    
                //HStack
                    //}//if
                //VStack
            //    }//.onDelete(perform: deleteItem)
                
            }.padding()//ForEach
               

            }
                .navigationBarItems(leading:VStack {
                    Text("Here it is!")
                        .font(.title)
                        .bold()
                
                }, trailing:
                    HStack{
                        
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width:30, height:30)
                        }
                            
                        })
                        
                                
            
        .sheet(isPresented: self.$show) {
            SenderView().environment(\.managedObjectContext, self.moc)
        }
    }
            }
    
  /*
    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            let item = savings[index]
            moc.delete(item)
           
        }
        
        do {
            try moc.save()
        } catch {
            // handle the Core Data error
        }
    }
 */
}
    }
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//End
}

