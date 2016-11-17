//
//  CheckMarkTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 16/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

class CheckMarkTableViewCell: UITableViewCell {

    @IBOutlet weak var firstOptionButton: DFRadioButton!
    @IBOutlet weak var secondOptionButton: DFRadioButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedText = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func firstOptionButtonTapped(_ sender: AnyObject) {
        firstOptionButton.isChecked = true
        secondOptionButton.isChecked = false
        selectedText = (firstOptionButton.titleLabel?.text)!
    }
    
    @IBAction func secondOptionButtonTapped(_ sender: AnyObject) {
        firstOptionButton.isChecked = false
        secondOptionButton.isChecked = true
        selectedText = (secondOptionButton.titleLabel?.text)!
    }
    
}
