//
//  CheckMarkTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 16/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

class CheckMarkTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedText = ""
    var buttonNames = [String]()
    var dfRadioButtonController: DFRadioButtonController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(attributes:Attributes) {
        nameLabel.text = attributes.label
    }
    
    func addButtonsToController(names:[String], yAxis: Int) {
        var buttonArray = [DFRadioButton]()
        var xAxis = 0
        buttonNames = names
        for name in buttonNames {
            let buttonWidth = (name.characters.count * 10) + 50
            let rButton = DFRadioButton(frame: CGRect(x: xAxis, y: ((yAxis/2)-15), width: buttonWidth, height: 30))
            rButton.setTitle(name, for: .normal)
            self.contentView.addSubview(rButton)
            rButton.isChecked = false
            rButton.layoutIfNeeded()
            buttonArray.append(rButton)
            xAxis = xAxis + buttonWidth
        }
        dfRadioButtonController = DFRadioButtonController(buttons: buttonArray)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension CheckMarkTableViewCell: DFRadioButtonDelegate {
    func dfButtonDidSelect(button: DFRadioButton) {
        print(button.titleLabel?.text)
    }
}
