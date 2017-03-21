//
//  Note+CoreDataHelpers.swift
//  CoolNotes
//
//  Created by Christopher Combes on 3/21/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import CoreData
import Foundation

extension Note {
    convenience init(text: String = "New Note", context: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Note", in: context) {
            self.init(entity: entity, insertInto: context)
            self.text = text
            self.creationDate = NSDate()
        } else {
            fatalError("Unasble to find Entity name!")
        }
    }
    var humanReadableAge : String {
        get {
            let format = DateFormatter()
            format.timeStyle = .none
            format.dateStyle = .short
            format.doesRelativeDateFormatting = true
            format.locale = Locale.current
            
            return format.string(from: creationDate as! Date)
        }
    }
}


