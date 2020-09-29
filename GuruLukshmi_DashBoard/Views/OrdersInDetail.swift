//
//  OrdersInDetail.swift
//  DashBoard
//
//  Created by Xcode User on 2020-09-20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import SwiftUI

struct OrdersInDetail: View {
    @State private var showingAlert = false
    var orderDetail: Orders
    var body: some View {
        
        VStack(spacing: 100){
            //List{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    ForEach(orderDetail.listOfOrder){ eachOrder in
                        
                           // Text(eachOrder.foodRefrence.foodName)
                           // Text("\(eachOrder.foodQuantity)")
                            DisplayOrder(food: eachOrder).cornerRadius(15)
                    }
                }
            }.padding(.horizontal, 30)
            //}
            Button(action: {
                self.showingAlert = true
            }) {
                Text("Print Order").padding()
                .foregroundColor(Color.black)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .background(Color.green.cornerRadius(10))
                )
                }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Order is Printing"), dismissButton: .default(Text("OK")))
            }
            }
        }
}



struct OrdersInDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrdersInDetail(orderDetail: Orders())
    }
}
