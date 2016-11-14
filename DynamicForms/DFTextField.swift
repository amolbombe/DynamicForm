//
//  DFTextField.swift
//  DynamicForms
//
//  Created by Softcell on 14/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

class DFTextField: UITextField {

    var nameLabel: UILabel?
    var errorLabel: UILabel?
    var validationData: [ValidationData]?
    
    var nameText: String?{
        didSet {
            nameLabel?.text = nameText
        }
    }
}
