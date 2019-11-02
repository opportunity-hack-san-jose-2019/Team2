//
//  ErrorPresenter.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

struct ErrorPresenter {
    let message: String
    
    func present(in controller: UIViewController) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        // add default OK action
        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )
        // present the alert
        controller.present(alert, animated: true)
    }
}
