//
//  TripleTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 11/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

class TripleTableViewCell: UITableViewCell {
    @IBOutlet weak var firstInputView: CustomInputView!
    @IBOutlet weak var secondInputView: CustomInputView!
    @IBOutlet weak var thirdInputView: CustomInputView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
