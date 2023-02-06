//
//  UIVIew+Extension.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

