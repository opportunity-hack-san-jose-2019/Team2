//
//  TabBarViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/3/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet weak var surveyTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surveyTabBar.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
