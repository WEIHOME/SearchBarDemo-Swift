//
//  CustomTableViewCell.swift
//  SearchBarDemo
//
//  Created by Weihong Chen on 30/04/2015.
//  Copyright (c) 2015 Weihong. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTextLabel(text: String){
        nameLabel.text = text
    }

}
