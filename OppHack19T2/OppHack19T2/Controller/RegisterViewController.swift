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
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var isChecked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.backgroundColor = UIColor.blue
//        button1.backgroundColor = UIColor.blue
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
    
    @IBAction func buttonTapped(_ sender: Any) {
//        if sender.backgroundColor == Constants.BOOL_BUTTON.enabled {
//          return
//        }
//        sender.backgroundColor = Constants.BOOL_BUTTON.enabled
//
//        switch sender {
//        case self.leftButton:
//          self.rightButton.backgroundColor = Constants.BOOL_BUTTON.disabled
//
//        case self.rightButton:
//          self.leftButton.backgroundColor = Constants.BOOL_BUTTON.disabled
//
//        default:
//          return
    }
    
}
