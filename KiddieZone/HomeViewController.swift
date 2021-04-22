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

    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var lettersBtnOutlet: UIButton!
    
    
    @IBOutlet weak var booksBtnOutlet: UIButton!
    
    
    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
           // keyChainService().keyChain.delete("uid")
            self.navigationController?.popViewController(animated: true)
        }
        catch{
            print (error)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "backgroundMusic",ofType: "wav")!))
            audioPlayer.prepareToPlay()
            let audioSession = AVAudioSession.sharedInstance()
            do{
                try audioSession.setCategory(AVAudioSession.Category.playback)
            }
            catch{
                
            }
        }
        catch{
            print(error)
        }*/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
    }
    
    @IBAction func booksBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "booksSegue", sender: self)
    }
   

    @IBAction func lettersBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "lettersSegue", sender: self)
    }
    
    
    @IBAction func numbersBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "numbersSegue", sender: self)
    }
    
    
    @IBAction func videosBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "videosSegue", sender: self)
        SwiftSpinner.show("Opening Videos ..")
        SwiftSpinner.hide()
    }
}
