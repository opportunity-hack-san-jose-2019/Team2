//
//  pickerViewController.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class pickerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: PickerViewTableView!
    
    var questions : [String] = []
    
    var docRef: DocumentReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = .clear
        
        let db = Firestore.firestore()
        
        db.collection("mentee_survey").whereField("type", isEqualTo: "single-value")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let docData = document.data()
                        self.questions.append(docData["title"] as? String ?? "")
                        self.tableView.reloadData()
                    }
                    print("gum\(self.questions)")                }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickerCell", for: indexPath) as! PickerViewTableViewCell
        print("gux:\(cell)")
                
        cell.question.text = questions[indexPath.row]
                
        return cell
        
    }

}
