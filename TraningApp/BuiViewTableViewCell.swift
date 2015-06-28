//
//  BuiViewTableViewCell.swift
//  tableViewtest
//
//  Created by 比嘉　和之 on 2015/06/28.
//  Copyright (c) 2015年 比嘉　和之. All rights reserved.
//

import UIKit

class BuiViewTableViewCell: UITableViewCell {

    @IBOutlet weak var BuiName: UILabel!
    @IBOutlet weak var Kg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
