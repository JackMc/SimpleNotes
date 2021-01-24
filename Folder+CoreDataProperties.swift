//
//  Folder+CoreDataProperties.swift
//  SimpleNotes
//
//  Created by Jack McCracken on 2021-01-23.
//
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var created_at: Date?
    @NSManaged public var title: String?
    @NSManaged public var updated_at: Date?
    @NSManaged public var note: NSSet?

}

// MARK: Generated accessors for note
extension Folder {

    @objc(addNoteObject:)
    @NSManaged public func addToNote(_ value: Note)

    @objc(removeNoteObject:)
    @NSManaged public func removeFromNote(_ value: Note)

    @objc(addNote:)
    @NSManaged public func addToNote(_ values: NSSet)

    @objc(removeNote:)
    @NSManaged public func removeFromNote(_ values: NSSet)

}

extension Folder : Identifiable {

}
