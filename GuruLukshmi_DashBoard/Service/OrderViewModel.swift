//
//  OrderViewModel.swift
//  DashBoard
//
//  Created by Xcode User on 2020-09-20.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

class OrderViewModel: ObservableObject {
    @Published var orderList = [Orders]()
    @Published var historyOrderList = [Orders]()
    private var db = Firestore.firestore()
    
    init() {
        fetchData()
        fetchHistoryData()
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
    
    func fetchHistoryData() {
        db.collection("OrderHistory")
        .order(by: "orderedTime")
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot{
                self.historyOrderList = querySnapshot.documents.compactMap{ document in
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
    
    func addToHistory(_ order: Orders) {
        do{
            let _ = try db.collection("OrderHistory").addDocument(from: order)
        }
        catch{
            fatalError("Can't add to History \(error.localizedDescription)")
        }
    }
}
