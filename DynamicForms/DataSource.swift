//
//  DataSource.swift
//  DynamicForms
//
//  Created by Softcell on 08/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import Foundation
import UIKit

class DataSource: NSObject, DropDownDelegate {
    let fieldArrays: [BaseClass]!
//    var dataSource: TextFieldDataSource!
    weak var delegate: DropDownDelegate?
    
    init(fields: [BaseClass]) {
        self.fieldArrays = fields
    }
    
    func setDelegate(delegate: DropDownDelegate) {
        self.delegate = delegate
    }
    
    func showPopOver(popover: UIViewController) {
        delegate?.showPopOver(popover: popover)
    }
}

extension DataSource: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch fieldArrays[indexPath.row].type! as String {
        case "input":
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldTableViewCell", for: indexPath) as! SingleFieldTableViewCell
            if let attribtute = fieldArrays[indexPath.row].attributes {
                for attrbt in attribtute {
                        cell.baseView.setData(attributes: attrbt)
                        cell.baseView.textField.delegate = self
                }
            }
            return cell
        case "double":
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoubleInputTableViewCell", for: indexPath) as! DoubleInputTableViewCell
            if let attribtute = fieldArrays[indexPath.row].attributes {
                var count = 0
                for attrbt in attribtute {
                    switch count {
                    case 0:
                        cell.firstInputView.setData(attributes: attrbt)
                        cell.firstInputView.textField.delegate = self
                        break
                    case 1:
                        cell.secondInputView.setData(attributes: attrbt)
                        cell.secondInputView.textField.delegate = self
                        break
                    default:
                        break
                    }
                    count += 1
                }
            }
            return cell
        case "triple":
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripleTableViewCell", for: indexPath) as! TripleTableViewCell
            if let attribtute = fieldArrays[indexPath.row].attributes {
                var count = 0
                for attrbt in attribtute {
                    switch count {
                    case 0:
                        cell.firstInputView.setData(attributes: attrbt)
                        cell.firstInputView.textField.delegate = self
                        break
                    case 1:
                        cell.secondInputView.setData(attributes: attrbt)
                        cell.secondInputView.textField.delegate = self
                        break
                    case 2:
                        cell.thirdInputView.setData(attributes: attrbt)
                        cell.thirdInputView.textField.delegate = self
                        break
                    default:
                        break
                    }
                    count += 1
                }
            }
            return cell
        case "dropdown":
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownTableViewCell", for: indexPath) as! DropDownTableViewCell
            cell.setDelegate(delegate: self)
            if let attribtute = fieldArrays[indexPath.row].attributes {
                for attrbt in attribtute {
                cell.setData(attributes: attrbt)
                cell.sArray = attrbt.values!
                }
            }
            return cell
        case "radio":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckMarkTableViewCell", for: indexPath) as! CheckMarkTableViewCell
            if let attribtute = fieldArrays[indexPath.row].attributes {
                for attrbt in attribtute {
                cell.setData(attributes: attrbt)
                let y = cell.contentView.bounds.size.height
                cell.addButtonsToController(names: attrbt.values!, yAxis: Int(y))
            }
            }
            return cell
        case "check":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBoxTableViewCell", for: indexPath) as! CheckBoxTableViewCell
            if let attribtute = fieldArrays[indexPath.row].attributes {
                for attrbt in attribtute {
                cell.setData(attributes: attrbt)
                let y = cell.contentView.bounds.size.height
                cell.addButtonsToController(names: attrbt.values!, yAxis: Int(y))
            }
            }
            return cell
        case "image":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CameraTableViewCell", for: indexPath) as! CameraTableViewCell
            cell.setDelegate(delegate: self)
            if let attribtute = fieldArrays[indexPath.row].attributes {
                for attrbt in attribtute {
                cell.setData(attributes: attrbt)
            }
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldTableViewCell", for: indexPath) as! SingleFieldTableViewCell
            if let attribtute = fieldArrays[indexPath.row].attributes {
                for attrbt in attribtute {
                }
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let type = fieldArrays[indexPath.row].type! as? String {
            if type == "image" {
                return 100
            } else {
                return 80
            }
        }
        return 80
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
            let regEx = validate.regx//"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let range = testStr.range(of: regEx!, options: .regularExpression, range: nil, locale: nil)
            result = range != nil ? true : false
        }
        return result
    }
}
