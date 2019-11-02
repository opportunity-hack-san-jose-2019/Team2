//
//  RegisterViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import Firebase
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        
        if(email.isEmpty || password.isEmpty) {
            ErrorPresenter(message: "Please fill out all the fields").present(in: self)
            return
        }
        
        else {
            Auth.auth().createUser(withEmail: email, password: password) { user, error in
                if(error == nil && user != nil) {
                    print("Registration Successful!")
                }
                else {
                    print("Error: \(error!.localizedDescription)")
                }
            }
        }
    }
}
