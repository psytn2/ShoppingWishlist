//
//  Product+CoreDataProperties.swift
//  ShoppingWishlist
//
//  Created by Tai Nguyen Bui on 30/01/16.
//  Copyright © 2016 Tai Nguyen Bui. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {
    
    @NSManaged var reference: String?
    @NSManaged var title: String?
    @NSManaged var shop: String?
    @NSManaged var image: NSData?
}
