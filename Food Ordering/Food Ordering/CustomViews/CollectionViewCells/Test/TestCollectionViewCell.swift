//
//  TestCollectionViewCell.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit
import Kingfisher

class TestCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TestCollectionViewCell"

    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TestCollectionViewCell", bundle: nil)
    }
    
    func setup(with dish: Dish) {
        lbl1.text = dish.name
        lbl2.text = dish.description
        lbl3.text = dish.formattedCalories
        img.kf.setImage(with: dish.image?.asURL)
    }
}
