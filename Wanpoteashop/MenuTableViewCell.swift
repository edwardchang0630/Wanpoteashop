//
//  MenuTableViewCell.swift
//  Wanpoteashop
//
//  Created by Yuan-Che Chang on 2020/9/9.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
   
    
    override func awakeFromNib() {
       
   
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
