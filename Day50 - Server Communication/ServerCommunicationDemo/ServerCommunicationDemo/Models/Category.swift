//
//  Category.swift
//  ServerCommunicationDemo
//
//  Created by KSHRD on 12/21/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category {
    var id: Int
    var name: String
    
    init(_ data: JSON) {
        id = data["id"].int ?? 0
        name = data["name"].string ?? ""
    }
}
