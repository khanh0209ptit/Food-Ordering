//
//  ApiResponse.swift
//  Food Ordering
//
//  Created by Quang Khánh on 10/01/2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
