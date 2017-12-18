//
//  TableViewSectionHeader.swift
//  ServerCommunication
//
//  Created by Kokpheng on 11/10/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import UIKit

class TableViewSectionHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Border radius
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.height / 2
        profileImageView.layer.masksToBounds = true
        
        // border
        profileImageView.layer.borderColor = #colorLiteral(red: 0.3593114018, green: 0.3654612899, blue: 0.7423183322, alpha: 1)
        profileImageView.layer.borderWidth = 1
        
    }
}
