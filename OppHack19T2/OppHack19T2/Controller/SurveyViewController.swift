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

        docRef = Firestore.firestore().collection("mentee_survey").document("Q12")
        
        let teams = docRef.map {$0.value(forKey: "title")}
        for team in teams {
            guard let validTeam = team as? Dictionary<String, Any> else {continue}
            let name = validTeam["name"] as? String ?? ""
            let officeId = validTeam["officeId"] as? String ?? ""
            print("name: \(name)")
        }
        
//        print("test: \(docRef.collection("title"))")
        
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let property = document.data()?["title"] as? [String: Any]
//                print("Document data: \(property ?? "test")")
//            } else {
//                print("Document does not exist")
//            }
//        }
        
//        docRef.getDocument(source: .cache) { (document, error) in
//            if let document = document {
//                let property = document.get("title")
//                print("test: \(property)")
//            } else {
//                print("does not exist in cache")
//            }
//        }
        
//        docRef.addSnapshotListener { (docSnapshot, error) in
//            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
//            let myData = docSnapshot.data()
//            //userPhoto
//            let latestPhotoURL = myData!["title"] as? String ?? ""
//            print("test: \(latestPhotoURL)")
//        }



        
        let dataToSave: [String: Any] = [
            "title": testTF.text
        ]
        
        docRef.setData(dataToSave, merge: true) { (error) in
            if let error = error {
                print("Fun: \(error.localizedDescription)")
            }
        }
        print("data saved")
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
