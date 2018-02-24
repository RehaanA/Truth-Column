//
//  ResultTableViewCell.swift
//  Truth Column
//
//  Created by Rehaan Advani on 5/28/17.
//  Copyright © 2017 Rehaan Advani. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    var nameLabel = UILabel()
    var descLabel = UILabel()
    
    /**
        This method sets and displays the name label.
    */
    func drawNameLabel() {
        self.nameLabel.font = UIFont(name: "Avenir", size: 17)
        self.nameLabel.textAlignment = .left
        self.contentView.addSubview(self.nameLabel)
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.5, constant: 0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: 20))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.nameLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0))
        
    }
    
    /**
        This method sets and displays the description label.
     */
    func drawDescLabel() {
        self.descLabel.font = UIFont(name: "Avenir", size: 17)
        self.descLabel.textAlignment = .right
        self.contentView.addSubview(self.descLabel)
        
        self.descLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addConstraint(NSLayoutConstraint(item: self.descLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 0.5, constant: 0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.descLabel, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1.0, constant: -20))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.descLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0))
    }

    /**
        This method calls the two methods described above.
     */
    func draw() {
        self.drawNameLabel()
        self.drawDescLabel()
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
