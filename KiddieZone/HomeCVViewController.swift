//
//  HomeCVViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/25/21.
//

import UIKit
import SwiftSpinner
import Firebase

class HomeCVViewController: UIViewController {

  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
           self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.systemOrange
        
    }
   
    @objc func logoutUser(){
         print("clicked")
        guard let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as? ViewController else { return  }
                                                                                    
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
   
}
    extension HomeCVViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return topics.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicCollectionViewCell", for: indexPath) as! TopicCollectionViewCell
            cell.setup(with: topics[indexPath.row])
            return cell
        }
    }

    extension HomeCVViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 150, height: 225)
        }
    }

    extension HomeCVViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let topicTitle = topics[indexPath.row].title
            print(topics[indexPath.row].title)
            if topicTitle == "Books"
            {
                guard let booksViewController = self.storyboard?.instantiateViewController(withIdentifier: "BooksVC") as? BooksViewController else { return  }
                                                                                            
                self.navigationController?.pushViewController(booksViewController, animated: true)
            }
            if topicTitle == "Letters"
            {
                guard let lettersViewController = self.storyboard?.instantiateViewController(withIdentifier: "LettersVC") as? LettersViewController else { return  }
                                                                                            
                self.navigationController?.pushViewController(lettersViewController, animated: true)
            }
            if topicTitle == "Numbers"{
                guard let numbersViewController = self.storyboard?.instantiateViewController(withIdentifier: "NumbersVC") as? NumbersViewController else { return  }
                                                                                            
                self.navigationController?.pushViewController(numbersViewController, animated: true)
            }
            if topicTitle == "Videos"{
            
                guard let videosViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideosVC") as? VideosViewController else { return  }
                                                                                            
                self.navigationController?.pushViewController(videosViewController, animated: true)
                SwiftSpinner.show("Opening Videos ..")
                SwiftSpinner.hide()
            }
        }
    }



    

   


