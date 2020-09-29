//
//  FoodCategory.swift
//  DashBoard
//
//  Created by Xcode User on 2020-09-29.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FoodCategory: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var foodType: String
    var categoryImage: String
}
