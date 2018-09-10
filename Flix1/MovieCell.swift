//
//  MovieCell.swift
//  Flix1
//
//  Created by user143116 on 9/9/18.
//  Copyright © 2018 MSU. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
 
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var overview: UILabel!
    
    
    @IBOutlet weak var posterimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
