//
//  ViewController.swift
//  SocialApp
//
//  Created by Petr on 16.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper


class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    
    @IBOutlet weak var pwdField: FancyField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }
    
    
    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("ANDI: unable to authenticate with Facebook \(error)")
            } else if result?.isCancelled == true {
                print("ANDI: User cancelled facebook authentication")
            } else {
                print("ANDI: authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("ANDI: Unable to authenticate with Firebase - \(error)")
            } else {
                print("ANDI: Successfully authenticated with Firebase...")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
            }
        }
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("ANDI: eMail user authenticated with Firebase")
                    if let user = user {
                    self.completeSignIn(id: user.uid)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("ANDI: unable to authenticate with Firebase using eMail. \(error)")
                        } else {
                            print("ANDI: Successfully authenticated with Firebase/email")
                            if let user = user {
                            self.completeSignIn(id: user.uid)
                            }
                        }
                    })
                }
            })
        }
    }
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("KeychainResult: \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

