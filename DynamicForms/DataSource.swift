//
//  DataSource.swift
//  DynamicForms
//
//  Created by Softcell on 08/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import Foundation
import UIKit

class DataSource: NSObject {
    let fieldArrays: [BaseClass]!
//    var dataSource: TextFieldDataSource!
    
    init(fields: [BaseClass]) {
        self.fieldArrays = fields
    }
}

extension DataSource: UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch fieldArrays[indexPath.row].type! as String {
        case "input":
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldTableViewCell", for: indexPath) as! SingleFieldTableViewCell
            if let attrbt = fieldArrays[indexPath.row].attributes {
                cell.baseView.setData(attributes: attrbt)
                if let validation = attrbt.validationData {
                    cell.baseView.textField.errorLabel = cell.baseView.errorLbl
                    cell.baseView.textField.nameLabel = cell.baseView.nameLbl
                    cell.baseView.textField.validationData = validation
                    cell.baseView.textField.delegate = self
                }
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldTableViewCell", for: indexPath) as! SingleFieldTableViewCell
            let attrbt = fieldArrays[indexPath.row].attributes
            return cell
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let custom = textField as? DFTextField
        print(custom)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let custom = textField as? DFTextField {
        if !validate(testStr: textField.text!, value: custom.validationData!) {
            for validate in custom.validationData! {
                custom.errorLabel?.text = validate.message
            }
        } else {
            custom.errorLabel?.text = ""
        }
        }
    }
    
    func validate(testStr: String, value: [ValidationData]) -> Bool {
        var result = false
        for validate in value {
            let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let range = testStr.range(of: regEx, options: .regularExpression, range: nil, locale: nil)
            result = range != nil ? true : false
        }
        return result
    }
}
