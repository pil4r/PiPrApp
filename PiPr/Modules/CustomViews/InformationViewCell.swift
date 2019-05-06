//
//  InformationViewCell.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

class InformationViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var subtitleToDescriptionConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
