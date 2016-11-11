//
//  ViewController.swift
//  DynamicForms
//
//  Created by Softcell on 08/11/16.
//  Copyright © 2016 Softcell. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var datasource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        let quotes = [
            Quote(author: "Albert Einstein", text: "Two things are infinite: the universe and human stupidity; and I am not sure about the universe."),
            Quote(author: "Steve Jobs", text: "Design is not just what it looks like and feels like. Design is how it works."),
            Quote(author: "John Lennon", text: "Life is what happens when you’re busy making other plans.")
        ]
        
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
        
        DispatchQueue.main.async {
            self.setUpTableView()
        }
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
        tableView.dataSource = self.datasource
        tableView.reloadData()
    }
}
