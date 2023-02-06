//
//  OnboardingCollectionViewCell.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    @IBOutlet private weak var slideDescription: UILabel!
    @IBOutlet private weak var slideTitleLbl: UILabel!
    @IBOutlet private weak var slideImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
    }
    
    func setup(with slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescription.text = slide.description
    }
}

