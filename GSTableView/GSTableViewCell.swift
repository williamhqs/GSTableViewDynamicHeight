//
//  TestTableViewCell.swift
//  testAutoLayoutCell
//
//  Created by 胡秋实 on 6/19/15.
//  Copyright (c) 2015 William Hu. All rights reserved.
//

import UIKit

class GSTableViewCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
