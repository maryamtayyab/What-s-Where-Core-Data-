//
//  Home.swift
//  What's Where (Core Data)
//
//  Created by Maryam TayyabII on 2020-10-27.
//

import SwiftUI
import CoreData
struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
 
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
                        
                        ForEach(results) { task in
                            
                            VStack(alignment: .leading, spacing:5, content: {
                                Text(task.content ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                             
                            })
                            
                            .foregroundColor(.black)
                            
                            
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
