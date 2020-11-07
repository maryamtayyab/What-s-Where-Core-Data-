//
//  Home.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-10-27.
//


// HOME FEED PAGE

import SwiftUI
import CoreData
struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
    
    @Environment(\.managedObjectContext) var context
 
    // Fetching Data
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "content", ascending:true)],animation: .spring()) var results : FetchedResults<Item>
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            
        
            VStack {
                
                HStack{
                    Text("Here it is")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                         
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    LazyVStack(alignment: .leading, spacing:20) {
                        
                        ForEach(results) { item in
                            
                            VStack(alignment: .leading, spacing:5, content: {
                                //shows item name
                                Text(item.content ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .offset(x:100)
                                
                                Text(item.location ?? "")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .offset(x:100)
                            })
                            
                            .foregroundColor(.black)
                           
                                Button(action: {
                                    context.delete(item)
                                    try! context.save()
                                    
                                        
                                },
                                label: {
                                    Text("Delete")
                                        .font(Font.system(size: 16, design: .default))
                                        .foregroundColor(Color.red)
                                       
                                        
                                       
                                       
                                       
                                        
                                        
                                }).offset(x:270)
                               
                            
                            
                            
                               
                            
                        }
                    }
                    .padding()
                })
            }
            
            Button(action: {homeData.isNewData.toggle()}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color.green)
                    .clipShape(Circle())
                
            })
            .padding()
        })
        
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges:.all))
       
        .sheet(isPresented: $homeData.isNewData, content: {
        
            NewDataView(homeData: homeData)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
