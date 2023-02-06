//
//  Dish.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import Foundation

struct Dish: Decodable {
    let id, name, image, description: String?
    let calories: Int?
    
    var formattedCalories: String? {
        return "\(calories ?? 0) calories"
    }
}
