//
//  Entry.swift
//  Day 3.2 journal
//
//  Created by Angela Montierth on 2/8/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation



class Entry: Equatable {
    
    private let timestampKey = "timestampKey"
    private let titleKey = "titleKey"
    private let bodyTextKey = "bodyTextKey"
    
    
    var timestamp: Date
    var title: String
    var bodyText: String
    
    init(timestamp: Date = Date(), title: String, bodyText: String) {
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
        
    }
    // The container for the food, so we can put it in the fridge
    
    var dictionaryRepresentation: [String: Any] {
        return [timestampKey: timestamp, titleKey: title, bodyTextKey: bodyText]
    }
    
    // Taking the food out of the container and putting in into a bowl (turning it from a dictionary to an instance of Song)
    
    init?(dictionary: [String:Any]) {
        guard let timestamp = dictionary[timestampKey] as? Date, let title = dictionary[titleKey] as? String, let bodyText = dictionary[bodyTextKey] as? String  else { return nil }
        
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}
