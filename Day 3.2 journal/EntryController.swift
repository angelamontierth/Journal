//
//  EntryController.swift
//  Day 3.2 journal
//
//  Created by Angela Montierth on 2/8/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedController = EntryController()
    
    
    //8---------------------CRUD--------------------------8//
    
    // CREATE 8-------------------------------------
    
    var entries: [Entry] = []
    
    // READ 8-------------------------------------
    
    func add(entry: Entry) {
        self.entries.append(entry)
    }
    
    // UPDATE 8-------------------------------------
    
    
    
    // DELETE 8-------------------------------------
    
    func remove(entry:Entry ) {
        
        guard let index = entries.index(of: entry) else { return }
        
        entries.remove(at: index)
        
        }
        
    }


