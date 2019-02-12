//
//  StatementTableViewCell.swift
//  TesteiOSv2
//
//  Created by anderson.jesus.silva on 12/02/2019.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(statement:StatementList) {
        if let dt = statement.date {
            self.lbDate.text = dt.convertDate
        }
        
        if let value = statement.value {
            self.lbValue.text = value.formatCurrency()
        }
    }
    
}
