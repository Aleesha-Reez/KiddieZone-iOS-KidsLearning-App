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
       // errorLabel.alpha = 0
       /* do
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
        
        player.play()*/
        setUpElements()
    }

   /* override func viewDidAppear(_ animated: Bool) {
        let keyChain = keyChainService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "homeSegue", sender: self)
        }
    }*/
    
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(userEmailTxt)
        Utilities.styleTextField(userPasswordTxt)
        Utilities.styleFilledButton(loginBtn)
        Utilities.styleFilledButton(loginBtn)
        
    }
    
     @IBAction func loginBtnAction(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
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
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    
       /* let email = userEmailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = userPasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if email == "" || password == "" || password.count < 6{
            errorLabel.text = "Please enter valid Email/Password"
            return
        }
      
        
        let cleanedPassword = userPasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            errorLabel.text = "Please enter valid Email"
            return
        }
        
        SwiftSpinner.show("Logging in ..")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            SwiftSpinner.hide()
               guard let self = self else { return }
            
            if error != nil{
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.alpha = 1
                return
            }
            
            let uid = Auth.auth().currentUser?.uid
            self.addKeyChainAfterLogin(uid!)
            self.performSegue(withIdentifier: "homeSegue", sender: self)
        }*/
    }
     
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: self)
    }
    
    /*func addKeyChainAfterLogin(_ uid : String ){
        let keyChain = keyChainService().keyChain
        keyChain.set(uid, forKey: "uid")
    }*/

    
}
   
   
