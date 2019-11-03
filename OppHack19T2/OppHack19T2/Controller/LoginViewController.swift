//
//  LoginViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func FirebaseLogin(_ sender: Any) {
        let email = emailTF.text
        let password = passwordTF.text
        Auth.auth().signIn(withEmail: email ?? "", password: password ?? "") { (result, error) in
            if (error != nil) {
                print(error)
                ErrorPresenter(message: "Please fill out all the fields").present(in: self)
                return
            }
            else {
                print("Firebase Sign In Success")
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
}
