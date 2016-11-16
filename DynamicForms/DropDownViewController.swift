//
//  DropDownViewController.swift
//  DynamicForms
//
//  Created by Softcell on 16/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit

protocol SetDropDownDelegate: class {
    func setDropDownValue(selectedValue: String)
}

class DropDownViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: SetDropDownDelegate?
    
    var sArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDelegate(delegate: SetDropDownDelegate) {
        self.delegate = delegate
    }
}

extension DropDownViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.setDropDownValue(selectedValue: sArray[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

extension DropDownViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return sArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = sArray[indexPath.row]
        return cell
    }
    
}

