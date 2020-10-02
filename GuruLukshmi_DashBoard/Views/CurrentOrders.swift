//
//  CurrentOrders.swift
//  GuruLukshmi_Kiosk
//
//  Created by Dhruvil Patel on 2020-09-20.
//

import SwiftUI

struct CurrentOrders: View {
        
    @State private var showingAlert = false
    @ObservedObject var orderVM = OrderViewModel()
    @State private var deleteIndexSet: IndexSet?
   // @State var deleteOrder = Orders()
   // @EnvironmentObject var envObj: GlobalVariables
    
    var body: some View {
        NavigationView{
        ZStack{
            VStack {
                List{
                    ForEach(orderVM.orderList, id: \.self){ order in
                        NavigationLink(destination: OrdersInDetail(orderDetail: order)) {
                            Text("Customer Name: \(order.cName) \nOrder Id: \(order.id ?? "")")
                        }
                        }.onDelete(perform: deleteItem)
                }
            }.edgesIgnoringSafeArea(.all).padding(.top, 30)
                .navigationBarTitle(Text("Current Orders"))
        }
        }
    }

    
    func deleteItem(at offset: IndexSet) {
        orderVM.orderList.remove(atOffsets: offset)
        
    }
}


struct CurrentOrders_Previews: PreviewProvider {
    static var previews: some View {
        CurrentOrders().environmentObject(GlobalVariables())
    }
}

struct swipeGesture : UIViewRepresentable {
    
    func makeCoordinator() -> swipeGesture.Coordinator {
        return swipeGesture.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<swipeGesture>) -> UIView   {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        let left = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.left))
        left.direction = .left
        
        view.addGestureRecognizer(left)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<swipeGesture>) {
        
    }
    
    class Coordinator: NSObject {
        @ObservedObject var orderVM = OrderViewModel()
        @EnvironmentObject var envObj: GlobalVariables
        @objc func left(){
            print("ADDED TO HISTORY")
            orderVM.deleteOrder(self.envObj.deletedOrder)
            
        }
    }
    
}
    
