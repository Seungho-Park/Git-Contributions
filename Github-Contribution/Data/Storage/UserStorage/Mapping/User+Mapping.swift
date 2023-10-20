//
//  User+Mapping.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData

extension UserEntity {
    convenience init(profile: User, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        self.host = profile.host
        self.type = Int32(profile.type.rawValue)
        self.username = profile.username
        self.token_id = Int16(profile.token_id)
    }
    
    func toDomain()-> User {
        .init(type: .init(rawValue: Int(type))!, host: host, username: username ?? "Invalid User", token_id: Int(token_id))
    }
}
