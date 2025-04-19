//
//  UserEntity+CoreDataProperties.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/19/25.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var password: String?
    @NSManaged public var nickname: String?

}

extension UserEntity : Identifiable {

}
