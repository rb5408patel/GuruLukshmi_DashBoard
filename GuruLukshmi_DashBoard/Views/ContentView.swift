//
//  ContentView.swift
//  GuruLukshmi_DashBoard
//
//  Created by Xcode User on 2020-09-29.
//  Copyright © 2020 Xcode User. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    var arrString = ["Orders" , "History"]
    @ObservedObject var orderVM = OrderViewModel()
    @State var currentOrders = 0
    init() {
        self.orderVM.fetchData()
    }
    var body: some View {
        NavigationView{
        ZStack{
            Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
        
            VStack{
                Text("DASHBOARD").foregroundColor(.white)
                    .font(.largeTitle)
                Text("Current Orders: \(self.orderVM.orderList.count)").padding().border(Color.green, width: 3)
                    .font(.title).foregroundColor(.white)
                List{
                    //ForEach(arrString , id: \.self){ str in
                        NavigationLink(destination: CurrentOrders()) {
                            Text("Current Orders")
                        }
                   // }
                    NavigationLink(destination: HistoryView()) {
                        Text("History")
                    }
                }
            
            }
            
        }.onAppear{
            self.currentOrders = self.orderVM.orderList.count
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

