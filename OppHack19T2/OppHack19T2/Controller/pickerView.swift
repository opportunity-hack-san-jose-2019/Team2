//
//  pickerView.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

class pickerView: UIView {

    @IBOutlet var picker: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
//        Bundle.main.loadNibNamed("pickerView", owner: self, options: nil)
//        addSubview(picker)
//        picker.frame = self.bounds
//        picker.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
