//
//  ViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/9/21.
//

import UIKit
import Firebase
import SwiftSpinner
import AVFoundation
import FirebaseAuth

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
   
    @IBOutlet weak var userEmailTxt: UITextField!
    
    
    @IBOutlet weak var userPasswordTxt: UITextField!
    
    
   
    @IBOutlet weak var loginBtn: UIButton!
    
   
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        do
        {
                    let audioPath = Bundle.main.path(forResource: "backgroundSong", ofType: "mp3")
                    try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
                    //PROCESS ERROR
        }
                
        let session = AVAudioSession.sharedInstance()
                
        do
        {
                    try session.setCategory(AVAudioSession.Category.playback)
        }
        catch
        {
                    
        }
                
        player.play()
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        setUpElements()
    }

    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(userEmailTxt)
        Utilities.styleTextField(userPasswordTxt)
        Utilities.styleFilledButton(loginBtn)
        Utilities.styleHollowButton(signUpBtn)
        
    }
    
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
        let email = userEmailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = userPasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
           else {
            
           /* let storyboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyboard.instantiateViewController(identifier: "LettersVC")
            self.navigationController?.pushViewController(vc, animated: true)*/
               
            
                guard let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeCV1") as? HomeCVViewController else { return  }
                self.navigationController?.pushViewController(homeViewController, animated: true)
                self.view.window?.makeKeyAndVisible()
            
                print(email)
                print(password)
              
                self.userEmailTxt.text = ""
                self.userPasswordTxt.text = ""
            
            }
        }
    
    }

    
     
    @IBAction func signUpAction(_ sender: Any) {
        guard let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpViewController else { return  }
                                                                                     
         self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    

       /* guard let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpViewController else { return  }
                                                                                    
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    */
    
}
   
   
