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
    
    var questions : [String] = []
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! FreeResponseTableViewCell
        
        cell.question.text = questions[indexPath.row]
        
        return cell
    }
    
    @IBOutlet weak var freeResponseTableView: FreeResponseTableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
        db.collection("mentee_survey").whereField("type", isEqualTo: "free")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let docData = document.data()
                        self.questions.append(docData["title"] as? String ?? "")
                        self.freeResponseTableView.reloadData()
                    }
                }
        }
        
    }
}
