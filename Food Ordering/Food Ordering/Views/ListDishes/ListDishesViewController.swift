//
//  ListDishesViewController.swift
//  Food Ordering
//
//  Created by Quang Khánh on 09/01/2023.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var dishes = [Dish]()
    var category: DishCategory!
    static let identifier = "ListDishesViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.title
        registerCell()
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            switch result {
            case.success(let dishes):
                ProgressHUD.dismiss()
                // set data dishes cho biến dishes của object hiện tại
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ListDishesViewController", bundle: nil)
    }
    
    private func registerCell() {
        tableView.register(DishListTableViewCell.nib(), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListDishesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(with: dishes[indexPath.row])
        return cell
    }
}

extension ListDishesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiace()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

