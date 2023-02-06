//
//  DishListTableViewCell.swift
//  Food Ordering
//
//  Created by Quang Khánh on 09/01/2023.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = "DishListTableViewCell"
    
    @IBOutlet private weak var descriptionLbl: UILabel!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var dishImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DishListTableViewCell", bundle: nil)
    }

    func setup(with dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(with order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        titleLbl.text = order.dish.name
        descriptionLbl.text = order.name
    }
}
