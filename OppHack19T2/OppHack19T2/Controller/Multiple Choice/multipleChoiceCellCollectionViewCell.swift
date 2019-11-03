//
//  multipleChoiceCellCollectionViewCell.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/3/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

class multipleChoiceCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var multipleChoiceText: UILabel!
    
    func displayContent(image: UIImage, text: String) {
        backgroundImage.image = image
        multipleChoiceText.text = text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
