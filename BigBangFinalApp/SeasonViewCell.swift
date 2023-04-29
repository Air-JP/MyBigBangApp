//
//  SeasonViewCell.swift
//  BigBangFinalApp
//
//  Created by Jose Portilla Portilla on 7/4/23.
//

import UIKit

class SeasonViewCell: UITableViewCell {

    @IBOutlet weak var seasonImage: UIImageView!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        seasonImage.image = nil
        seasonLabel.text = nil
    }

}
