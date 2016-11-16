//
//  DFRadioButton.swift
//  DynamicForms
//
//  Created by Softcell on 16/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit
@IBDesignable class DFRadioButton: UIButton {

    // Images
    let checkedImage = UIImage(named: "CheckButton")! as UIImage
    let uncheckedImage = UIImage(named: "UncheckedButton")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                print("true >")
                self.setImage(checkedImage, for: .normal)
            } else {
                print("false >")
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.isChecked = false
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }

}
