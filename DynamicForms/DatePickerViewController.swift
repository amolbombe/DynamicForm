//
//  DatePickerViewController.swift
//  DynamicForms
//
//  Created by Softcell on 22/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

protocol DFDatePickerDelegate: class {
    func DidDateSelected(selectedValue: String)
}

class DatePickerViewController: UIViewController {

    var datePicker : UIDatePicker!
    var delegate: DFDatePickerDelegate?
    
    var minDate = ""
    var maxDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pickUpDate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickUpDate() {
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: 300, height: 300))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.minimumDate = dateFromSring(dateString: minDate)
        datePicker.maximumDate = dateFromSring(dateString: maxDate)
        self.view.addSubview(datePicker)
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        toolBar.frame = CGRect(x: 0, y: 5, width: 300, height: 30)
        self.view.addSubview(toolBar)
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DatePickerViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(DatePickerViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        let date = dateFormatter1.string(from: datePicker.date)
        delegate?.DidDateSelected(selectedValue: date)
        dismiss(animated: true, completion: nil)
    }
    
    func cancelClick() {
        dismiss(animated: true, completion: nil)
    }
    
    func dateFromSring(dateString: String) -> Date {
        if dateString.isEmpty {
            return Date()
        }
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd/MM/YYYY"
        let date = dateFormatter1.date(from: dateString)
        return date!
    }
}
