//
//  UIViewController.swift
//  Food Ordering
//
//  Created by Quang Khánh on 09/01/2023.
//

import UIKit

extension UIViewController {
    static var identifiar: String {
        return String(describing: self)
    }
    static func instantiace() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifiar) as! Self
        return controller
    }
}
