//
//  Order.swift
//  Food Ordering
//
//  Created by Quang Khánh on 10/01/2023.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish!
}
