//
//  PendingTableViewCell.swift
//  YogaApp
//
//  Created by Aroshini Dissanayake on 2023-04-21.
//

import UIKit

class PendingTableViewCell: UITableViewCell {
    
    
    @IBOutlet var pendingImage: UIImageView!
    @IBOutlet var pendingName: UILabel!
    @IBOutlet var pendingType: UILabel!
    @IBOutlet var pendingDuration: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
 
}
