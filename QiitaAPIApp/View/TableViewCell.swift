//
//  TableViewCell.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/11/29.
//  Copyright © 2019 remuty. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
