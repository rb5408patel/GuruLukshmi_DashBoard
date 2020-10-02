//
//  OrderViewModel.swift
//  DashBoard
//
//  Created by Xcode User on 2020-09-20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import Foundation
import FirebaseFirestore

class OrderViewModel: ObservableObject {
    @Published var orderList = [Orders]()
    private var db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        db.collection("Orders")
        .order(by: "orderedTime")
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot{
                self.orderList = querySnapshot.documents.compactMap{ document in
                    do{
                        let x = try document.data(as: Orders.self)
                        return x
                    }
                    catch{
                        print(error)
                    }
                    return nil
                    
                }
            }
        }
    }
    
    func deleteOrder(_ order: Orders){
        if let orderID = order.id{
            db.collection("Orders").document(orderID).delete(){ err in
                if let err = err{
                    print("Error deleting Order: \(err)")
                }else{
                    print("Order deleted!")
                }
            }
        }
    }
}
