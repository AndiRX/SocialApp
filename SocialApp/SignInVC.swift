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


class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            }
        }
    }

}

