//
//  TextFieldDataSource.swift
//  DynamicForms
//
//  Created by Softcell on 11/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import Foundation
import UIKit

protocol ValidationDelegate {
    func showErrorMessage(message: String, tagOfCell: Int)
}

class TextFieldDataSource: NSObject, UITextFieldDelegate {
    let validateData: ValidationData!
    var delegate: ValidationDelegate! = nil
    
    init(validation: ValidationData) {
        self.validateData = validation
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !validate(testStr: textField.text!, value: validateData) {
            print("input sahi nahi bhai....")
        } else {
            print("input sahi he bhai....")
        }
    }
    
    func validate(testStr: String, value: ValidationData) -> Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
//        let range = testStr.rangeOfString(regEx, options:.RegularExpressionSearch)
        let range = testStr.range(of: regEx, options: .regularExpression, range: nil, locale: nil)
        let result = range != nil ? true : false
        return result
    }
}
