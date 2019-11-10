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
    
    var techAnswers : [String] = []
    
    var industryAnswers : [String] = []
    
    var rolesAnswers : [String] = []

    var locationAnswers : [String] = []

    var valueAnswers : [String] = []
    
    var questionsAnswers : [String] = []
    
    var wordMathAnswers : [String] = []
    
    var interestsAnswers : [String] = []
    
    var skillsAnswers : [String] = []
    
    var experiencesAnswers : [String] = []
    
    var courseworkAnswers : [String] = []
    
    var ethnicAnswers : [String] = []
    
    var companyStageAnswers : [String] = []
    
    @IBOutlet weak var multipleChoiceTableView: MultipleChoiceTableView!
    
//    func getAnswers(answers: String) -> [String] {
//
//        var docID : String
//
//        let db = Firestore.firestore()
//
//        if answers == "coursework" {
//            docID = "T7mIikAqX5uvE1Qxg6mR"
//        } else if answers == "engagement type"{
//            docID = "PeTyC1j00XV174NtiPee"
//        } else if answers == "ethnic background"{
//            docID = "Bs41ZkS9SzN0FCoS7gAO"
//        } else if answers == "experiences"{
//            docID = "eWxGHMsG6yToyszUY490"
//        } else if answers == "engagement type"{
//            docID = "PeTyC1j00XV174NtiPee"
//        } else if answers == "graduation year"{
//            docID = "E6qhy0RZECJO2sAlGiqR"
//        } else if answers == "industry"{
//            docID = "jrgdF2q37cgi590y1fGV"
//        } else if answers == "engagement type"{
//            docID = "PeTyC1j00XV174NtiPee"
//        } else if answers == "engagement type"{
//            docID = "PeTyC1j00XV174NtiPee"
//        }
//
//        let docRef = db.collection("variables").document("ADGrycpeXHGh5KzxCMcc").collection(answers).document("jrgdF2q37cgi590y1fGV")
//
//
//
//        docRef.getDocument { (document, error) in
//             if let document = document, document.exists {
//                 let docData = document.data()
//                var option1 : [String] = [
//                    docData!["1"] as? String ?? "",
//                    docData!["2"] as? String ?? "",
//                    docData!["3"] as? String ?? "",
//                    docData!["4"] as? String ?? "",
//                    docData!["5"] as? String ?? "",
//                    docData!["6"] as? String ?? "",
//                    docData!["7"] as? String ?? "",
//                    docData!["8"] as? String ?? "",
//                    docData!["9"] as? String ?? "",
//                    ]
//
//                self.answers = option1
//                self.multipleChoiceTableView.reloadData()
//
//              } else {
//                 print("Document does not exist")
//              }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        
//        answers.removeAll()
        
        self.multipleChoiceTableView.separatorColor = .clear
        
        let docRef2 = db.collection("mentee_survey").whereField("type", isEqualTo: "multi-value")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let docData = document.data()
                        self.questions.append(docData["title"] as? String ?? "")
                        self.multipleChoiceTableView.reloadData()
                    }
                }
        }
        
//        let docRef = db.collection("variables").document("ADGrycpeXHGh5KzxCMcc").collection("industry").document("jrgdF2q37cgi590y1fGV")
//
//        docRef.getDocument { (document, error) in
//             if let document = document, document.exists {
//                 let docData = document.data()
//                var option1 : [String] = [
//                    docData!["1"] as? String ?? "",
//                    docData!["2"] as? String ?? "",
//                    docData!["3"] as? String ?? "",
//                    docData!["4"] as? String ?? "",
//                    docData!["5"] as? String ?? "",
//                    docData!["6"] as? String ?? "",
//                    docData!["7"] as? String ?? "",
//                    docData!["8"] as? String ?? "",
//                    docData!["9"] as? String ?? "",
//                    ]
//
//                self.answers = option1
//                self.multipleChoiceTableView.reloadData()
//
//              } else {
//                 print("Document does not exist")
//              }
//        }
                
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var array : [String] = []
        
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? multipleChoiceTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDataSource: self, dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "multipleChoiceTBCell", for: indexPath) as! multipleChoiceTableViewCell
        
        cell.question.text = questions[indexPath.row]
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectViewCell",
                                                      for: indexPath) as! multipleChoiceCellCollectionViewCell

        cell.multipleChoiceText.text = "answer"
        

        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
}
