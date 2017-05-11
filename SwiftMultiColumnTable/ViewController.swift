//
//  ViewController.swift
//  SwiftMultiColumnTable
//
//  Created by jafharsharief.b on 11/10/16.
//  Copyright © 2016 Exilant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var stateTableView: UITableView!
    var stateCapitalDict = [String:String]()
    var stateCapitalList = [CapitalModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "MultiColumn Table"
        createValueForDictionary()
//        stateTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createValueForDictionary() {
        stateCapitalDict = ["Karnataka":"Bangalore", "Maharastra":"Mumbai", "Delhi":"Delhi", "Tamil Nadu":"Chennai", "West Bengal":"Kolkata"]
        
        for item in stateCapitalDict {
            let capitalModelData:CapitalModel = CapitalModel(state: item.key, capital: item.value)
            stateCapitalList += [capitalModelData]
        }
        print(stateCapitalList)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateCapitalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRowModel = stateCapitalList[indexPath.row]
        let cell:UITableViewCell = stateTableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        let stateLabel:UILabel  = cell.viewWithTag(100) as! UILabel
        let capitalLabel:UILabel = cell.viewWithTag(101) as! UILabel
        let stateCodelabel:UILabel = cell.viewWithTag(102) as! UILabel
        
        stateLabel.text = currentRowModel.state
        capitalLabel.text = currentRowModel.capital
        stateCodelabel.text = currentRowModel.stateCode
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell:UITableViewCell = stateTableView.dequeueReusableCell(withIdentifier: "HeaderCell")! as UITableViewCell
        let stateLabel:UILabel  = headerCell.viewWithTag(103) as! UILabel
        let capitalLabel:UILabel = headerCell.viewWithTag(104) as! UILabel
        let stateCodelabel:UILabel = headerCell.viewWithTag(105) as! UILabel

        stateLabel.text = "State"
        capitalLabel.text = "Capital"
        stateCodelabel.text = "State Code"
        
        headerCell.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return headerCell
        
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40;
    }
    

}

