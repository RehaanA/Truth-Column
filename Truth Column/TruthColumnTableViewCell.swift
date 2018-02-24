//
//  TruthColumnTableViewCell.swift
//  Truth Column
//
//  Created by Rehaan Advani on 5/22/17.
//  Copyright © 2017 Rehaan Advani. All rights reserved.
//

import UIKit

class TruthColumnTableViewCell: UITableViewCell {
    var textField = UITextField()
    
    /**
        This method sets and displays the text field used to accept user input in the table view.
     */
    func drawTextField() {
        self.contentView.addSubview(self.textField)
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addConstraint(NSLayoutConstraint(item: self.textField, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.75, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.textField, attribute: .centerX, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.textField, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
    
    /**
        This method calls the method described above.
     */
    func draw() {
        self.drawTextField()
    }
    
    /**
        This method is an initializer of this class.
     */
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.draw()
    }
    
    /**
        This method is an initializer of this class.
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
