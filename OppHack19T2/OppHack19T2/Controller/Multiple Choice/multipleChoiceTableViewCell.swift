//
//  multipleChoiceTableViewCell.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/3/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

class multipleChoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    @IBOutlet private weak var multipleChoiceCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDataSource: UICollectionViewDataSource, dataSourceDelegate: UICollectionViewDelegate, forRow row: Int) {
        multipleChoiceCollectionView.delegate = dataSourceDelegate
        multipleChoiceCollectionView.dataSource = dataSourceDelegate as? UICollectionViewDataSource
        multipleChoiceCollectionView.tag = row
        multipleChoiceCollectionView.reloadData()
    }

}
