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
    private let entriesKey = "entriesKey"
    
    
    
    
    // Treat this initializer as a lifecycle function.
    init() {
        loadFromPersistentStore()
    }
    
    
    //8---------------------CRUD--------------------------8//
    
    // CREATE 8-------------------------------------
    
    func add(entry: Entry) {
        self.entries.append(entry)
        saveToPersistentStore()
    }
    
    // READ 8-------------------------------------
    
    var entries: [Entry] = []
    
    // UPDATE 8-------------------------------------
    
    
    
    // DELETE 8-------------------------------------
    
    func remove(entry:Entry ) {
        
        guard let index = entries.index(of: entry) else { return }
        
        entries.remove(at: index)
        saveToPersistentStore()
        
        }
    
    
    
    // SAVING 8------------------------------------------
    
    func saveToPersistentStore() {
        var entryDictionaries: [[String: Any]] = []
        
        for entry in entries {
            let entryDictionary = entry.dictionaryRepresentation
            entryDictionaries.append(entryDictionary)
        }
        
         UserDefaults.standard.set(entryDictionaries, forKey: entriesKey)
    }
    func loadFromPersistentStore() {
        guard let entryDictionaries = UserDefaults.standard.value(forKey: entriesKey) as? [[String:Any]] else { return }
        
        var entries: [Entry] = []
        
        for entryDictionary in entryDictionaries {
            guard let entry = Entry(dictionary: entryDictionary) else { break }
            
            entries.append(entry)
            
        }
        
        self.entries = entries
    }
    
    
    
    }


