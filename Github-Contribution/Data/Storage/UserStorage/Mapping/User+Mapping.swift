//
//  User+Mapping.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData

extension User {
    convenience init(profile: Profile, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        self.host = profile.host
        self.id = Int32(profile.id)
        self.type = Int32(profile.type.rawValue)
        self.username = profile.username
        self.token_id = Int32(profile.tokenId)
    }
}
