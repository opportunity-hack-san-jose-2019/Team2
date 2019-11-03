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
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var isChecked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.backgroundColor = UIColor.blue
//        button1.backgroundColor = UIColor.blue
        
//        // Create a gradient layer.
//        let gradientLayer = CAGradientLayer()
//        // Set the size of the layer to be equal to size of the display.
//        gradientLayer.frame = view.bounds
//        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
//        // This example uses a Color Literal and a UIColor from RGB values.
//        gradientLayer.colors = [#colorLiteral(red: 0.4372955561, green: 0.6854210496, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2566329241, green: 0.4919913411, blue: 1, alpha: 1).cgColor]
//        // Rasterize this static layer to improve app performance.
//        gradientLayer.shouldRasterize = true
//        // Apply the gradient to the backgroundGradientView.
//        card.layer.insertSublayer(gradientLayer, at: 0)
        
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
                    self.performSegue(withIdentifier: "registerSegue", sender: self)
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
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
