//
//  ViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//
//    @IBOutlet weak var registerButton: UIButton!
//    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }

    @IBAction func loginButton(_ sender: Any) {

    }
    
}

