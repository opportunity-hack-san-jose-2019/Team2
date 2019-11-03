//
//  textFieldViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/3/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class FreeResponseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! FreeResponseTableViewCell
        
        let db = Firestore.firestore()
        
        db.collection("mentee_survey").whereField("type", isEqualTo: "free")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let docData = document.data()
                        cell.question.text = docData["title"] as? String ?? ""
                        
                    }
                }
        }
        return cell
    }
    
    @IBOutlet weak var freeResponseTableView: FreeResponseTableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
