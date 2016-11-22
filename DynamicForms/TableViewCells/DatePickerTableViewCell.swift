//
//  DatePickerTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 22/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell, DFDatePickerDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datePickerButton: UIButton!
    
    var minDate = ""
    var maxDate = ""
    
    weak var delegate: DropDownDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(attributes:Attributes) {
        nameLabel.text = attributes.label
        minDate = attributes.minimumDate!
        maxDate = attributes.maximumDate!
    }
    
    func setDelegate(delegate: DropDownDelegate) {
        self.delegate = delegate
    }
    
    @IBAction func datePickerButtonTapped(_ sender: UIButton, forEvent event: UIEvent) {
        
        //let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = DatePickerViewController()
        vc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 300) //storyboard.instantiateViewController(withIdentifier: "popoverVC") as! DropDownViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        vc.preferredContentSize = CGSize(width: 300, height: 300)
//        vc.setDelegate(delegate: self)
//        vc.sArray = self.sArray
//        popover.delegate = self
        popover.sourceView = datePickerButton
        let buttonView = sender as UIView
        let touch = event.allTouches?.first
        let point = (touch?.location(in: buttonView) ?? CGPoint.zero)
        popover.sourceRect = CGRect(x: point.x, y: point.y, width: 0, height: 0)
        vc.delegate = self
        vc.minDate = self.minDate
        vc.maxDate = self.maxDate
        vc.pickUpDate()
        delegate?.showPopOver(popover: vc)
    }
    
    func DidDateSelected(selectedValue: String) {
        datePickerButton.setTitle(selectedValue, for: .normal)
    }
}
