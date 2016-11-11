//
//  SingleFieldTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 09/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

class SingleFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var baseView: CustomInputView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataToFields(placeHolder: String) {
    }
}
