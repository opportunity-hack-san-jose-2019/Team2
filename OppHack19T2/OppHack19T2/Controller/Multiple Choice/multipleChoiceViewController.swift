//
//  multipleChoiceViewController.swift
//  OppHack1/Users/piercetu/Documents/GitHub/Team2/OppHack19T2/OppHack19T2/Controller/Multiple Choice/multipleChoiceTableViewCell.swift9T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class multipleChoiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var questions : [String] = []
    
    @IBOutlet weak var multipleChoiceTableView: MultipleChoiceTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        var array : [String] = []

        db.collection("mentee_survey").whereField("type", isEqualTo: "multi-value")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let docData = document.data()
                        
                        array.append(docData["title"] as? String ?? "")
                        
                    }
                    
                    self.questions = array
                    print("foody:\(self.questions)")
                    
                }
        }
                
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        guard let tableViewCell = cell as? multipleChoiceTableViewCell else { return }
//
//
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var array : [String] = []
        array = self.questions
        
        print("screw:\(questions.count)")
        return 5
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? multipleChoiceTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDataSource: self, dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "multipleChoiceTBCell", for: indexPath) as! multipleChoiceTableViewCell
        
        var array : [String] = ["What industries are you interested in?", "What roles have you participated in?","What is your primary location?","What are your skills and experience?","What type of technical work experience do you have?"]
        
        cell.question.text = array[indexPath.row]
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectViewCell",
                                                      for: indexPath) as! multipleChoiceCellCollectionViewCell

        cell.multipleChoiceText.text = "fdgfdg"
        

        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
}
