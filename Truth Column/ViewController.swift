//
//  ViewController.swift
//  Truth Column
//
//  Created by Rehaan Advani on 5/22/17.
//  Copyright © 2017 Rehaan Advani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var NUM_ROWS = 0
    var NUM_SECTIONS = 2
    
    var tableView = UITableView()
    var scrollView = UIScrollView()
    var goButton = UIButton()
    var heightConstraint = NSLayoutConstraint()
    var data: [[Int]] = [[]]
    
    /**
        This method is called upon the app first launching.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar()
        self.presentAlert()
    }
    
    /**
        This method customizes and displays the navigation bar on the screen.
    */
    func navBar() {
        self.title = "Truth Columns"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let navigationTitleFont = UIFont(name: "Avenir", size: 20)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navigationTitleFont]
    }
    
    /**
        This method displays the alert prompting the user to specify how many rows of truth values they desire.
    */
    internal func presentAlert() {
        let alert = UIAlertController(title: "Number of Rows", message: "How many rows do you want in your truth table?", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Number of Rows"
        }
        let action = UIAlertAction(title: "Go!", style: .default) { (action) in
            self.NUM_ROWS = Int(alert.textFields![0].text!)!
            self.addScrollView()
            self.addTableView()
            self.addBtn()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
        This method sets and displays a scroll view.
    */
    func addScrollView() {
        self.scrollView.isScrollEnabled = true
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 64))
    }
    
    /**
        This method sets and displays the table view which is used to accept user input.
    */
    func addTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TruthColumnTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        self.tableView.isScrollEnabled = false
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 50
        self.scrollView.addSubview(self.tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .width, relatedBy: .equal, toItem: self.scrollView, attribute: .width, multiplier: 1.0, constant: 0.0))
        
        self.heightConstraint = NSLayoutConstraint(item: self.tableView, attribute: .height, relatedBy: .equal, toItem: self.scrollView, attribute: .height, multiplier: 0.0, constant: 0)
        self.scrollView.addConstraint(self.heightConstraint)
        
        self.scrollView.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .centerX, relatedBy: .equal, toItem: self.scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.scrollView.addConstraint(NSLayoutConstraint(item: self.tableView, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .top, multiplier: 1.0, constant: 0))
    }
    
    /**
        This method is from the UITableViewDataSource protocol, and it sets the properties of the cell.
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TruthColumnTableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TruthColumnTableViewCell
        
        cell.selectionStyle = .none
        cell.textField.placeholder = "Value " + String(indexPath.row + 1)
        
        return cell
    }
    
    /**
        This method specifies the number of sections in the table table view.
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.NUM_SECTIONS
    }
    
    /**
        This method specifies the number of rows in each section in the table table view.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.NUM_ROWS
    }
    
    /**
        This method specifies the height of each row in the table view.
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    /**
        This method customizes and displays the header in each section of the table view.
    */
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.textLabel!.font = UIFont(name: "Avenir-Next", size: 17)
        let headerFrame: CGRect = header.frame
        header.textLabel!.frame = headerFrame
        header.textLabel!.textAlignment = .left
    }
    
    /**
        This method specifies the title of each header in the table view.
    */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Column \(section + 1)"
    }
    
    /**
        This method ensures that the table view is self-sizing depending on the number of cells. It is a dynamic table view.
    */
    override func updateViewConstraints() {
        self.tableView.layoutIfNeeded()
        self.heightConstraint.constant = self.tableView.contentSize.height
        super.updateViewConstraints()
    }
    
    /**
        This method sets and displays the button that is used to go the results page.
    */
    func addBtn() {
        self.goButton.setTitle("Go!", for: .normal)
        self.goButton.setTitleColor(UIColor.white, for: .normal)
        self.goButton.backgroundColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0)
        self.goButton.addTarget(self, action: #selector(self.btnTapped(sender:)), for: .touchUpInside)
        self.goButton.titleLabel?.font = UIFont(name: "Avenir", size: 17)
        self.goButton.layer.cornerRadius = 10
        self.goButton.clipsToBounds = true
        self.scrollView.addSubview(self.goButton)
        
        self.goButton.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addConstraint(NSLayoutConstraint(item: self.goButton, attribute: .width, relatedBy: .equal, toItem: self.scrollView, attribute: .width, multiplier: 0.5, constant: 0))
        self.scrollView.addConstraint(NSLayoutConstraint(item: self.goButton, attribute: .height, relatedBy: .equal, toItem: self.scrollView, attribute: .height, multiplier: 0, constant: 40))
        self.scrollView.addConstraint(NSLayoutConstraint(item: self.goButton, attribute: .centerX, relatedBy: .equal, toItem: self.scrollView, attribute: .centerX, multiplier: 1.0, constant: 0))
        self.scrollView.addConstraint(NSLayoutConstraint(item: self.goButton, attribute: .top, relatedBy: .equal, toItem: self.tableView, attribute: .bottom, multiplier: 1.0, constant: 15))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.goButton, attribute: .bottom, multiplier: 1.0, constant: 75))
    }
    
    /**
        Method that is called when the button that is set above is tapped. 
    */
    func btnTapped(sender: UIButton) {
        for cell in self.tableView.visibleCells as! [TruthColumnTableViewCell] {
            if !(cell.textField.text == "0" || cell.textField.text == "1") {
                let alert = UIAlertController(title: "Error", message: "Enter vaid values", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        
        var counter = 0
        var col1 = [Bool]()
        var col2 = [Bool]()
        for cell in self.tableView.visibleCells as! [TruthColumnTableViewCell] {
            counter += 1
            if (counter >= self.NUM_ROWS) {
                if cell.textField.text == "0" {
                    col2.append(false)
                } else {
                    col2.append(true)
                }
            } else {
                if cell.textField.text == "0" {
                    col1.append(false)
                } else {
                    col1.append(true)
                }
            }
        }
        
        let detailView = TruthColumnDetailViewController()
        detailView.col1 = col1
        detailView.col2 = col2
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}

