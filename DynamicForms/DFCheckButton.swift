//
//  DFCheckButton.swift
//  DynamicForms
//
//  Created by Softcell on 18/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class DFCheckButton: UIButton {
    
    // Images
    let checkedImage = UIImage(named: "CheckBoxButton")! as UIImage
    let uncheckedImage = UIImage(named: "UncheckedBoxButton")! as UIImage
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isChecked = false
        self.setTitleColor(UIColor.black, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 10)
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.font = UIFont(name: "helvetica Neue", size: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.setTitleColor(UIColor.black, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
}
