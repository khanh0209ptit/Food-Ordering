//
//  CardView.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        //set all che do xem mac dinh co radius 10
        cornerRadius = 10
    }
    
}
