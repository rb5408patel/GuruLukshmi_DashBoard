//
//  Orders.swift
//  DashBoard
//
//  Created by Xcode User on 2020-09-29.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

//This will be the main Order strcuture which will be addded to database
struct Orders: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var cName: String = "Rutul Patel"
    var listOfOrder = [ListOfOrder]()
    @ServerTimestamp var orderedTime: Timestamp?
    
}
