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

class DropDownTableViewCell: UITableViewCell, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var dropDownButton: UIButton!
    weak var delegate: DropDownDelegate?
    var sArray = ["1", "2", "3"]

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
    
    @IBAction func dropDownButtonTapped(_ sender: AnyObject) {
        
//        var popoverContent = UIViewController()
//        var nav = UINavigationController(rootViewController: popoverContent)
//        nav.modalPresentationStyle = UIModalPresentationStyle.popover
//        var popover = nav.popoverPresentationController
//        popoverContent.preferredContentSize = CGSize(width: 200, height: 200)//(500,600)
//        popover?.delegate = self
//        popover?.sourceView = dropDownButton
//        popover?.sourceRect = CGRect(x: 100, y: 100, width: 0, height: 0)
//        delegate?.showPopOver(popover: nav)
//        viewController?.present(nav, animated: true, completion: nil
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "popoverVC")
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        vc.preferredContentSize = CGSize(width: 200, height: 45 * (sArray.count))//(500,600)
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 45 * (sArray.count)))
        tableView.delegate = self
        tableView.dataSource = self
        vc.view.addSubview(tableView)
        popover.delegate = self
        popover.sourceView = dropDownButton
        popover.sourceRect = CGRect(x: dropDownButton.bounds.size.width/2, y: dropDownButton.bounds.size.height/2, width: 0, height: 0)
        delegate?.showPopOver(popover: vc)
    }
    
}

extension DropDownTableViewCell: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dropDownButton.setTitle(sArray[indexPath.row], for: .normal)
        dropDownButton.titleLabel?.text = sArray[indexPath.row]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45.0
    }
}

extension DropDownTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return sArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = sArray[indexPath.row]
        return cell
    }
    
}

