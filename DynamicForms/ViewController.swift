//
//  ViewController.swift
//  DynamicForms
//
//  Created by Softcell on 08/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, DropDownDelegate {
    let validateData: [ValidationData]? = nil

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: DropDownDelegate?
    
    var datasource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        
        var fieldArray = [BaseClass]()
        let data: Data?
        if let url = Bundle.main.url(forResource: "Data", withExtension: "json") {
            if let data = NSData(contentsOf: url) as Data? {
                let json = JSON(data: data)
                for jsonValue in json.arrayValue {
                    fieldArray.append(BaseClass(json: jsonValue))
                }
            }
        }
        
        datasource = DataSource(fields: fieldArray)
        datasource.setDelegate(delegate: self)
        
        DispatchQueue.main.async {
            self.setUpTableView()
        }
    }
    
    func showPopOver(popover: UIViewController) {
        self.present(popover, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView() {
        let singleInputCellNib = UINib(nibName: "SingleFieldTableViewCell", bundle:nil)
        tableView.register(singleInputCellNib, forCellReuseIdentifier: "SingleFieldTableViewCell")
        let DoubleInputCellNib = UINib(nibName: "DoubleInputTableViewCell", bundle:nil)
        tableView.register(DoubleInputCellNib, forCellReuseIdentifier: "DoubleInputTableViewCell")
        let TripleInputCellNib = UINib(nibName: "TripleTableViewCell", bundle:nil)
        tableView.register(TripleInputCellNib, forCellReuseIdentifier: "TripleTableViewCell")
        let DropDownCellNib = UINib(nibName: "DropDownTableViewCell", bundle:nil)
        tableView.register(DropDownCellNib, forCellReuseIdentifier: "DropDownTableViewCell")
        let CheckMarkCellNib = UINib(nibName: "CheckMarkTableViewCell", bundle:nil)
        tableView.register(CheckMarkCellNib, forCellReuseIdentifier: "CheckMarkTableViewCell")
        
        let CameraCellNib = UINib(nibName: "CameraTableViewCell", bundle:nil)
        tableView.register(CameraCellNib, forCellReuseIdentifier: "CameraTableViewCell")
        tableView.dataSource = self.datasource
        tableView.delegate = self.datasource
        tableView.reloadData()
    }
}


