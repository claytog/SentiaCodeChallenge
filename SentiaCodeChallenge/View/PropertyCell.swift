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
        self.layer.masksToBounds = true
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(_ cell: PropertyCell, _ property: Property?) {
        
        // get thumbnail image from web service
        if let imageURL = property?.propertyImages?[0].attachment?.url {
            cell.propertyImage.setImageFromUrl(imageURL: imageURL, completion: { completed in
            })
        }
        cell.addressLabel.text = property?.location?.address
        if let bed = property?.bedrooms {
            cell.bedLabel.text = String(bed)
        }
        if let bath = property?.bathrooms {
            cell.bathLabel.text = String(bath)
        }
        if let car = property?.carspaces {
            cell.carLabel.text = String(car)
        }
        if let firstName = property?.agent?.firstName, let lastName = property?.agent?.lastName {
            cell.agentLabel.text = firstName + " " + lastName
        }
        // get thumbnail image from web service
        if let imageURL = property?.agent?.avatar?.small?.url {
                cell.avatarImage.setImageFromUrl(imageURL: imageURL, completion: { completed in
            })
        }
        
    }
    
}
