//
//  DataManager.swift
//  ServerCommunicationDemo
//
//  Created by Kokpheng on 11/18/16.
//  Copyright © 2016 Kokpheng. All rights reserved.
//

import Foundation

struct DataManager {
    struct URL {
        // Define url
        static let BASE = "http://35.197.133.50:9999/v1/api/"
        static let AUTH = BASE + "user/authentication"
        static let AUTH_WITH_FACEBOOK = BASE + "user/authentication_with_facebook"
        static let ARTICLE = BASE + "articles"
        static let FILE = BASE + "uploadfile/single"
        static let USER = BASE + "user"
    }
}




