//
//  CheckBoxTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 21/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

class CheckBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var selectedText = ""
    var buttonNames = [String]()
    var dfCheckButtonController: DFCheckBoxButtonController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(attributes:Attributes) {
        nameLabel.text = attributes.label
    }
    
    func addButtonsToController(names:[String], yAxis: Int) {
        var buttonArray = [DFCheckButton]()
        var xAxis = 0
        buttonNames = names
        for name in buttonNames {
            let buttonWidth = (name.characters.count * 10) + 50
            let rButton = DFCheckButton(frame: CGRect(x: xAxis, y: ((yAxis/2)-15), width: buttonWidth, height: 30))
            rButton.setTitle(name, for: .normal)
            self.contentView.addSubview(rButton)
            rButton.isChecked = false
            rButton.layoutIfNeeded()
            buttonArray.append(rButton)
            xAxis = xAxis + buttonWidth
        }
        dfCheckButtonController = DFCheckBoxButtonController(buttons: buttonArray)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension CheckBoxTableViewCell: DFCheckBoxButtonDelegate {
    func dfButtonDidSelect(button: DFCheckButton) {
        print(button.titleLabel?.text)
    }
}
