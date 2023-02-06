//
//  DishLandscapeCollectionViewCell.swift
//  Food Ordering
//
//  Created by Quang Khánh on 09/01/2023.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishLandscapeCollectionViewCell"

    @IBOutlet private weak var caloriesLbl: UILabel!
    @IBOutlet private weak var descriptionLbl: UILabel!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var dishImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DishLandscapeCollectionViewCell", bundle: nil)
    }
    
    func setup(with dish: Dish) {
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asURL)
    }
}
