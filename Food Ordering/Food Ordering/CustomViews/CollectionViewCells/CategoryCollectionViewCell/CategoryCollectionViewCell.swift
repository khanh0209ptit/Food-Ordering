//
//  CategoryCollectionViewCell.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"

    @IBOutlet private weak var categoryTitleLbl: UILabel!
    @IBOutlet private weak var categoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    func setup(with category: DishCategory) {
        categoryTitleLbl.text = category.title
        categoryImageView.kf.setImage(with: category.image?.asURL)
        
        print("DEBUG: \(category.title) ---------\(category.image)")
    }
}
