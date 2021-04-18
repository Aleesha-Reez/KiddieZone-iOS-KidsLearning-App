//
//  ViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/9/21.
//

import UIKit
import Firebase
import SwiftSpinner

class ViewController: UIViewController {


    @IBOutlet weak var userEmailTxt: UITextField!
    
    @IBOutlet weak var userPasswordTxt: UITextField!
    
    @IBOutlet weak var lblEmailPasswordStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let keyChain = keyChainService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "homeSegue", sender: self)
        }
    }
    
    
    func addKeyChainAfterLogin(_ uid : String ){
        let keyChain = keyChainService().keyChain
        keyChain.set(uid, forKey: "uid")
    }

    @IBAction func loginBtn(_ sender: Any) {
        
        let email = userEmailTxt.text!
        let password = userPasswordTxt.text!
        
        
        if email == "" || password == "" || password.count < 6{
            lblEmailPasswordStatus.text = "Please enter valid Email/Password"
            return
        }
      /*
        if email.isEmail == false{
            lblEmailPasswordStatus.text = "Please enter valid Email"
            return
        }*/
        
        SwiftSpinner.show("Logging in ..")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            SwiftSpinner.hide()
               guard let self = self else { return }
            
            if error != nil{
                self.lblEmailPasswordStatus.text = error?.localizedDescription
                return
            }
            
            let uid = Auth.auth().currentUser?.uid
            self.addKeyChainAfterLogin(uid!)
            self.performSegue(withIdentifier: "homeSegue", sender: self)
        }
    }
}

