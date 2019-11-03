//
//  SurveyViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore


class SurveyViewController: UIViewController {

    @IBOutlet weak var testTF: UITextField!
    @IBOutlet weak var test: UILabel!
    
    var docRef: DocumentReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let db = Firestore.firestore()
        let docRef = db.collection("mentee_survey").document("Q11")
        docRef.getDocument { (document, error) in
             if let document = document, document.exists {
                 let docData = document.data()
                 self.test.text = docData!["title"] as? String ?? ""
              } else {
                 print("Document does not exist")
              }
        }
    }

}
