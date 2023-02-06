//
//  DishDetailViewController.swift
//  Food Ordering
//
//  Created by Quang Khánh on 09/01/2023.
//

import UIKit
import Kingfisher
import ProgressHUD

final class DishDetailViewController: UIViewController {
    
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var descriptionLbl: UILabel!
    @IBOutlet private weak var caloriesLbl: UILabel!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var dishImageView: UIImageView!
    
    var dish: Dish!
    static let identifier = "DishDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularView()
    }
    
     private func popularView() {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
    

    @IBAction func placeOrderBtnClicked(_ sender: Any) {
        //loai bo khoang cach, check rong
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Placing Order ...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { [weak self] result in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
