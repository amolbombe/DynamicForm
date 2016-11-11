//
//  DataSource.swift
//  DynamicForms
//
//  Created by Softcell on 08/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import Foundation
import UIKit

struct Quote {
    let author: String
    let text: String
}

class DataSource: NSObject {
    let fieldArrays: [BaseClass]!
    var dataSource: TextFieldDataSource!
    
    init(fields: [BaseClass]) {
        self.fieldArrays = fields
    }
}

extension DataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch fieldArrays[indexPath.row].type! as String {
        case "input":
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldTableViewCell", for: indexPath) as! SingleFieldTableViewCell
            if let attrbt = fieldArrays[indexPath.row].attributes {
                cell.baseView.setData(attributes: attrbt)
                if let validation = attrbt.validationData?[0] {
                    dataSource = TextFieldDataSource(validation: validation)
                    cell.baseView.textField.delegate = self.dataSource
                }
            }
            return cell
        case "double":
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoubleInputTableViewCell", for: indexPath) as! DoubleInputTableViewCell
            if let attrbt = fieldArrays[indexPath.row].attributes {
                cell.firstInputView.setData(attributes: attrbt)
            }
            return cell
        case "Triple":
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripleTableViewCell", for: indexPath) as! TripleTableViewCell
            if let attrbt = fieldArrays[indexPath.row].attributes {
                cell.firstInputView.setData(attributes: attrbt)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldTableViewCell", for: indexPath) as! SingleFieldTableViewCell
            let attrbt = fieldArrays[indexPath.row].attributes
//            let plcHolder = attrbt?.placeHolder
//            cell.setDataToFields(placeHolder: plcHolder!)
            return cell
        }
    }
}
