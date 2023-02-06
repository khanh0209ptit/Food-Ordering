//
//  DishPortraitCollectionViewCell.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishPortraitCollectionViewCell"
    
    @IBOutlet private weak var descriptionLbl: UILabel!
    @IBOutlet private weak var caloriesLbl: UILabel!
    @IBOutlet private weak var dishImageView: UIImageView!
    @IBOutlet private weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DishPortraitCollectionViewCell", bundle: nil)
    }
    
    func setup(with dish: Dish) {
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asURL)
        
        print("DEBUGGG: \(dish.name) ---------\(dish.description)")
    }
}
