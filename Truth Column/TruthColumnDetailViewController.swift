//
//  TruthColumnDetailViewController.swift
//  Truth Column
//
//  Created by Rehaan Advani on 5/24/17.
//  Copyright © 2017 Rehaan Advani. All rights reserved.
//

import UIKit

class TruthColumnDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var col1 = [Bool]()
    var col2 = [Bool]()
    
    var tableView = UITableView()
    
    var categories = ["OR", "AND", "IMPLICATION", "BICONDITIONAL", "EQUIVALENT", "CONSISTENT", "ENTAILS"]
    var descs = [String]()

    /**
        This method is called upon the app first launching.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.initDescs()
        self.addTableView()
    }
    
    /**
        This method customizes and displays the navigation bar on the screen.
     */
    func navBar() {
        self.title = "Result"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let navigationTitleFont = UIFont(name: "Avenir", size: 20)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navigationTitleFont]
    }
    
    /**
        This method sets and displays the table view which is used to display the results.
     */
    func addTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
    
    /**
        This method invokes the methods in the TruthColumn class and stores the result in an array. 
    */
    func initDescs() {
        let or: [Bool] = TruthColumn.orOperator(col1: self.col1, col2: self.col2)!
        let and: [Bool] = TruthColumn.andOperator(col1: self.col1, col2: self.col2)!
        let impl: [Bool] = TruthColumn.implicationOperator(col1: self.col1, col2: self.col2)!
        let bi: [Bool] = TruthColumn.biconditionalOperator(col1: self.col1, col2: self.col2)!
        let isEquiv: Bool = TruthColumn.isEquivalent(col1: self.col1, col2: self.col2)
        let isCons: Bool = TruthColumn.isConsistent(col1: self.col1, col2: self.col2)
        let entails: Bool = TruthColumn.entails(col1: self.col1, col2: self.col2)
        
        self.descs.append(self.toString(arr: or))
        self.descs.append(self.toString(arr: and))
        self.descs.append(self.toString(arr: impl))
        self.descs.append(self.toString(arr: bi))
        self.descs.append("\(isEquiv)")
        self.descs.append("\(isCons)")
        self.descs.append("\(entails)")
    }
    
    /**
        This method is from the UITableViewDataSource protocol, and it sets the properties of the cell.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultTableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultTableViewCell
        
        cell.nameLabel.text = self.categories[indexPath.row]
        cell.descLabel.text = self.descs[indexPath.row]

        return cell
    }
    
    /**
        This method specifies the number of rows in each section in the table table view.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    /**
        This method specifies the height of each row in the table view.
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    /**
        This method returns the String representation of a truth column, represented as an array of Bool.
    */
    private func toString(arr: [Bool]) -> String {
        var str = "["
        for i in 0..<arr.count {
            if (i != arr.count - 1) {
                str += "\(arr[i])" + ", "
            } else {
                str += "\(arr[i])" + "]"
            }
        }
        return str
    }
}
