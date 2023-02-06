//
//  UserDefaults+Extension.swift
//  Food Ordering
//
//  Created by Quang Khánh on 12/01/2023.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        //true -> ck thang man hinh chinh, false -> man hinh cho
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
