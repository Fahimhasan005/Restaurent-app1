//
//  OnboardingViewController.swift
//  RestaurentApp
//
//  Created by Fahim Hasan on 2023/09/30.
//

import UIKit

class OnboardingViewController: UIViewController {

 
    
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var pageControll: UIPageControl!
    
    
   var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControll.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get started", for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "Category1")),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "Category2")),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "Catagory3"))
                 
         ]
       

        
        pageControll.numberOfPages = slides.count
    }
    
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
    
        // Example code setting the action programmatically
        //nextButton.addTarget(self, action: #selector(nextButtonClicked(_:)), for: .touchUpInside)

        if currentPage == slides.count - 1{
            //print("Go to the next page")
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC")as! UINavigationController
           controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            //UserDefaults.standard.hasOnboarded = true
            
           present(controller,animated: true,completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            CollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
        
        
    }
    
}

extension OnboardingViewController:
    UICollectionViewDelegate,
   UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        //pageControll.currentPage = currentPage
      }
    }
