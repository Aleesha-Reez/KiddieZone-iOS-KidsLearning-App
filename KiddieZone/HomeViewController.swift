//
//  HomeViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/10/21.
//

import UIKit
import Firebase
import SwiftSpinner
import AVFoundation

class HomeViewController: UIViewController {

  
    var player:AVAudioPlayer = AVAudioPlayer()
    @IBOutlet weak var lettersBtnOutlet: UIButton!
    
    
    @IBOutlet weak var booksBtnOutlet: UIButton!
    
    
    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
           // keyChainService().keyChain.delete("uid")
           // self.navigationController?.popViewController(animated: true)
            guard let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: Constant.Storyboard.ViewController) as? ViewController else { return  }
            self.navigationController?.pushViewController(mainViewController, animated: true)
           
        }
        catch{
            print (error)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
            navigationItem.leftBarButtonItem = backButton
        
    }
    
    @IBAction func booksBtnAction(_ sender: Any) {
       // self.performSegue(withIdentifier: "booksSegue", sender: self)
        guard let booksViewController = self.storyboard?.instantiateViewController(withIdentifier: "BooksVC") as? BooksViewController else { return  }
                                                                                    
        self.navigationController?.pushViewController(booksViewController, animated: true)
        
    }
   

    @IBAction func lettersBtnAction(_ sender: Any) {
        //self.performSegue(withIdentifier: "lettersSegue", sender: self)
        guard let lettersViewController = self.storyboard?.instantiateViewController(withIdentifier: "LettersVC") as? LettersViewController else { return  }
                                                                                    
        self.navigationController?.pushViewController(lettersViewController, animated: true)
    }
    
    
    @IBAction func numbersBtnAction(_ sender: Any) {
       // self.performSegue(withIdentifier: "numbersSegue", sender: self)
        guard let numbersViewController = self.storyboard?.instantiateViewController(withIdentifier: "NumbersVC") as? NumbersViewController else { return  }
                                                                                    
        self.navigationController?.pushViewController(numbersViewController, animated: true)
    }
    
    
    @IBAction func videosBtnAction(_ sender: Any) {
       // self.performSegue(withIdentifier: "videosSegue", sender: self)
        
        guard let videosViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideosVC") as? VideosViewController else { return  }
                                                                                    
        self.navigationController?.pushViewController(videosViewController, animated: true)
        SwiftSpinner.show("Opening Videos ..")
        SwiftSpinner.hide()
    }
}
