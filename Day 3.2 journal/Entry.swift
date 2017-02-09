//
//  Entry.swift
//  Day 3.2 journal
//
//  Created by Angela Montierth on 2/8/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation

class Entry: Equatable {
    var timestamp: Date
    var title: String
    var bodyText: String
    
    init(timestamp: Date = Date(), title: String, bodyText: String) {
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}
