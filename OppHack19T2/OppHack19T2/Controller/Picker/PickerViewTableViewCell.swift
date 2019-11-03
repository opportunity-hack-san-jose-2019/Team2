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
    
    var answers : [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        print("answers:\(answers)")
        return answers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return answers[row]
    }

    @IBOutlet weak var pickView: UIPickerView!
    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickView.dataSource = self
        pickView.delegate = self
        
        let db = Firestore.firestore()
        
        answers.removeAll()
        
        var array : [String] = []
        array.removeAll()
        
        let docRef = db.collection("variables").document("ADGrycpeXHGh5KzxCMcc").collection("technical area").document("CNdxDFQ6K33gexHn8CZ9")
        
        docRef.getDocument { (document, error) in
             if let document = document, document.exists {
                 let docData = document.data()
                var option1 = docData!["1"] as? String ?? ""
                var option2 = docData!["2"] as? String ?? ""
                var option3 = docData!["3"] as? String ?? ""
                
                self.answers.append(option1)
                self.answers.append(option2)
                self.answers.append(option3)
                
                self.pickView.reloadAllComponents()
                
              } else {
                 print("Document does not exist")
              }
        }
        
    }
}
