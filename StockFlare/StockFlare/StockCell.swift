//
//  StockCell.swift
//  StockFlare
//
//  Created by Reeve Yew on 08/02/2016.
//  Copyright © 2016 Reeve Yew. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {

    @IBOutlet weak var label_Name: UILabel!
    @IBOutlet weak var label_Ticker: UILabel!
    @IBOutlet weak var label_Price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
