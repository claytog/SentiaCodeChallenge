//
//  PropertyCell.swift
//  SentiaCodeChallenge
//
//  Created by Clayton on 5/5/21.
//

import UIKit

class PropertyCell: UITableViewCell {

    @IBOutlet weak var bedLabel: UILabel!
    @IBOutlet weak var bathLabel: UILabel!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var agentLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImage.layer.cornerRadius = 35
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
