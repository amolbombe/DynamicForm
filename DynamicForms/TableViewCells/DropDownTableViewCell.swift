//
//  DropDownTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 15/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

protocol DropDownDelegate: class {
    func showPopOver(popover: UIViewController)
}

class DropDownTableViewCell: UITableViewCell, UIPopoverPresentationControllerDelegate, SetDropDownDelegate {
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: DropDownDelegate?
    var sArray = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDelegate(delegate: DropDownDelegate) {
        self.delegate = delegate
    }
    
    func setDropDownValue(selectedValue: String) {
        dropDownButton.setTitle(selectedValue, for: .normal)
    }
    
    func setData(attributes:Attributes) {
        nameLabel.text = attributes.label
    }
    
    @IBAction func dropDownButtonTapped(_ sender: AnyObject) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "popoverVC") as! DropDownViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        vc.preferredContentSize = CGSize(width: 200, height: 45 * (sArray.count))
        vc.setDelegate(delegate: self)
        vc.sArray = self.sArray
        popover.delegate = self
        popover.sourceView = dropDownButton
        popover.sourceRect = CGRect(x: dropDownButton.bounds.size.width/2, y: dropDownButton.bounds.size.height/2, width: 0, height: 0)
        delegate?.showPopOver(popover: vc)
    }
}
