//
//  OnboardingViewController.swift
//  Food Ordering
//
//  Created by Quang Khánh on 08/01/2023.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet private weak var nextBtn: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var slides = [OnboardingSlide]()
    private var currentPage = 0 {
        //set text button khi cuon qua trang moi
        didSet {
            //cap nhap dieu khien trang
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemSlides()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func addItemSlides() {
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide2"))
        ]
        //so luong pages = so luong slide
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClick(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            print("Go to the next Home page")
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true)
        } else {
            //cap nhap trang khi click
            currentPage += 1
            //
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(with: slides[indexPath.row])
        return cell
    }
}
extension OnboardingViewController: UICollectionViewDelegate {
    
}
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    //scrollViewDidEndDecelerating: cuộn, giảm tốc độ cuộn
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        //cung cap trang xem hien tai
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
