//
//  ViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class ViewController: UIViewController {
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        
        view.settings.totalStars = 5
        view.settings.fillMode = .half
        view.settings.filledColor = UIColor.orange
        view.settings.emptyBorderColor = UIColor.orange
        view.settings.filledBorderColor = UIColor.orange
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(cosmosView)
        cosmosView.centerInSuperview()
        
        cosmosView.didTouchCosmos = { rating in
            print("Rating: \(rating)")
        }
    }

    @IBAction func registerButton(_ sender: Any) {
    }

    @IBAction func loginButton(_ sender: Any) {
    }
    
    
    
}

