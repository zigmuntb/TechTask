//
//  CustomTableViewCell.swift
//  TechTask
//
//  Created by Arsenkin Bogdan on 8/8/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	@IBOutlet weak var profilePictureImageView: UIImageView!
	
	@IBOutlet weak var linkLabel: UILabel!
	
	@IBOutlet weak var nameLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        profilePictureImageView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
