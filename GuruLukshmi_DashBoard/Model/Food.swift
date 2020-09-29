//
//  Food.swift
//  DashBoard
//
//  Created by Xcode User on 2020-09-29.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import Foundation

struct Food: Codable, Identifiable, Hashable {
    var id: String
    var foodName: String
    var foodDescription: String
    var foodType: FoodCategory
    var foodSubCategory: String?
    var imgName: String
    //var categoryImgName: String
    //var favourite: Bool
    
}



#if DEBUG
let testData =
    Food(id: "sg" , foodName: "Chilli Bajji (Pakora)", foodDescription: "Deep fried mild chillies coated with mildly spiced chick pea batter served with coconut and coriander chutney",  foodType: FoodCategory(id: UUID().uuidString, foodType: "Dosa", categoryImage: "Dosa"), foodSubCategory: "Finger Foods" , imgName: "springRoll")

#endif
