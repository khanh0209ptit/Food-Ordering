//
//  String+Extension.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
