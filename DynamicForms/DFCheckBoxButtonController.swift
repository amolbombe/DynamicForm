//
//  DFCheckBoxButtonController.swift
//  DynamicForms
//
//  Created by Softcell on 21/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import Foundation
import UIKit

protocol DFCheckBoxButtonDelegate: class {
    func dfButtonDidSelect(button: DFCheckButton)
}

class DFCheckBoxButtonController: NSObject {

    var buttonArray = [DFCheckButton]()
    var currentSelectedButton = [DFCheckButton]()
    var delegate: DFCheckBoxButtonDelegate?

    init(buttons: [DFCheckButton]) {
        super.init()
        buttonArray = buttons
        for button in buttons {
            button.addTarget(self, action: #selector(DFCheckBoxButtonController.buttonTapped(sender:)), for: UIControlEvents.touchUpInside)
        }
    }

    func buttonTapped(sender: DFCheckButton) {
        if sender.isChecked {
            sender.isChecked = false
            currentSelectedButton.remove(at: currentSelectedButton.index(of: sender)!)
//            sender.removeTarget(self, action: #selector(DFCheckButtonController.buttonTapped(sender:)), for: UIControlEvents.touchUpInside)
        } else {
            sender.isChecked = true
            currentSelectedButton.append(sender)
        }

        for button in currentSelectedButton {
            print(button.titleLabel?.text)
        }
    }
}
