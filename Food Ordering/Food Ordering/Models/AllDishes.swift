//
//  AllDishes.swift
//  Food Ordering
//
//  Created by Quang Khánh on 10/01/2023.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
