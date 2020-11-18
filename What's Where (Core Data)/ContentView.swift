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
        NSSortDescriptor(keyPath: \Saving.name, ascending: true),
        NSSortDescriptor(keyPath: \Saving.imageD, ascending: true),
        NSSortDescriptor(keyPath: \Saving.location, ascending: true)
       ]
    ) var savings : FetchedResults<Saving>
    
    
    
    @State var image : Data = .init(count: 0)
    
    @State var show = false
    
    var count = 0
    
    @State var text = ""
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
            
                ForEach(savings, id: \.self) { save in
                VStack(alignment: .leading) {
                   
                    Button(action: {
                        moc.delete(save)
                        
                        try! moc.save()
                        
                            
                    },
                    label: {
                        Text("Delete")
                            .font(Font.system(size: 16, design: .default))
                            .foregroundColor(Color.red)
                           
                            
                           
                           
                           
                            
                            
                    }).offset(x:250)
                        
                    //if self.text == save.name.self {
                    Text("\(save.name ?? "")")
                    .padding(3)
                    .font(.subheadline)
                    .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(5)
                    
                    Image(uiImage: UIImage(data: save.imageD ?? self.image)!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 34, height: 210)
                        .cornerRadius(15)
                    
                    HStack {
                    Text("\(save.location ?? "")")
                        .lineLimit(4)
                        Spacer()
                      
                        
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
                
                }, trailing:
                    HStack{
                        
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "camera.fill")
                        }
                            
                            
                            
                        })
                        
                                
            
        .sheet(isPresented: self.$show) {
            SenderView().environment(\.managedObjectContext, self.moc)
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

