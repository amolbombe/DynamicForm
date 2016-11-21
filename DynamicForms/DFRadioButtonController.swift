//
//  DFRadioButtonController.swift
//  DynamicForms
//
//  Created by Softcell on 18/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import Foundation
import UIKit

protocol DFRadioButtonDelegate: class {
    func dfButtonDidSelect(button: DFRadioButton)
}

class DFRadioButtonController: NSObject {
    
    var buttonArray = [DFRadioButton]()
    var currentSelectedButton: DFRadioButton? = nil
    var delegate: DFRadioButtonDelegate?
    
    init(buttons: [DFRadioButton]) {
        super.init()
        buttonArray = buttons
        for button in buttons {
            button.addTarget(self, action: #selector(DFRadioButtonController.buttonTapped(sender:)), for: UIControlEvents.touchUpInside)
        }
    }
    
    func buttonTapped(sender: DFRadioButton) {
        if sender.isChecked {
            sender.isChecked = false
            currentSelectedButton = nil
            delegate?.dfButtonDidSelect(button: currentSelectedButton!)
        } else {
            for button in buttonArray {
                if button.isChecked {
                    button.isChecked = false
                }
            }
            sender.isChecked = true
            currentSelectedButton = sender
            delegate?.dfButtonDidSelect(button: currentSelectedButton!)
        }
    }
}
