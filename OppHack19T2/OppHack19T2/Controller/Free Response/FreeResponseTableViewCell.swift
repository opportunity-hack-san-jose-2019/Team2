//
//  FreeResponseTableViewCell.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/3/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

class FreeResponseTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var freeResponseTextField: UITextView!
    
    var textChanged: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        freeResponseTextField.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textChanged(action: @escaping (String) -> Void) {
        self.textChanged = action
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textChanged?(freeResponseTextField.text)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textChanged = nil
    }

}
