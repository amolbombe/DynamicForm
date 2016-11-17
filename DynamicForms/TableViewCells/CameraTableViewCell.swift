//
//  CameraTableViewCell.swift
//  DynamicForms
//
//  Created by Softcell on 17/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

//protocol presentImageDelegate: class {
////    func
//}

class CameraTableViewCell: UITableViewCell, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var itemImageView: UIImageView!

    var imagePicker: UIImagePickerController!

    weak var delegate: DropDownDelegate?
    
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
    
    @IBAction func cameraButtonTapped(_ sender: AnyObject) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
//        presentViewController(imagePicker, animated: true, completion: nil)
        delegate?.showPopOver(popover: imagePicker)
    }
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            itemImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
