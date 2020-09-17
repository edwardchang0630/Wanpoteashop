//
//  OrderTableViewCell.swift
//  Wanpoteashop
//
//  Created by Yuan-Che Chang on 2020/9/16.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNameLabel: UILabel!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var sugarLabel: UILabel!
    
    @IBOutlet weak var iceLabel: UILabel!
    
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var bobaLabel: UILabel!
    
    @IBOutlet weak var iyuLabel: UILabel!
   
    @IBOutlet weak var taroballLabel: UILabel!
    
    @IBOutlet weak var grassjellyLabel: UILabel!
    
    @IBOutlet weak var puddingLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
