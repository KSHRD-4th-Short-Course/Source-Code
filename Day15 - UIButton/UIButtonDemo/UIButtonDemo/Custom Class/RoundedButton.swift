//
//  RoundedButton.swift
//  UIButtonDemo
//
//  Created by KSHRD on 11/1/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureProperty()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureProperty() {
        
        // Set title based on state
        self.setTitle("Normal", for: .normal)
        self.setTitle("Highlighted", for: .highlighted)
        self.setTitle("Disable", for: .disabled)
        self.setTitle("Selected", for: .selected)
        
        // Set background color
        self.backgroundColor = .gray
        
        // Set cornerRadius and border
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        

    }

}
