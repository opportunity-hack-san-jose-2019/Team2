//
//  PickerViewTableViewCell.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/3/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class PickerViewTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var questions : [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return questions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return questions[row]
    }

    @IBOutlet weak var pickView: UIPickerView!
    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickView.dataSource = self
        pickView.delegate = self
        
        let db = Firestore.firestore()
        
        var array : [String] = []
        array.removeAll()
        
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
}
