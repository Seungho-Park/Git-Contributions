//
//  Account+Mapping.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import CoreData

extension Account {
    convenience init(profile: Profile, context: NSManagedObjectContext) {
        self.init(context: context)
        self.host = profile.host
        self.username = profile.username
        self.type = Int32(profile.type.rawValue)
    }
    
    func toDomain()-> Profile {
        return .init(id: 0, type: VCSType(rawValue: Int(type))!, host: host, username: username!, name: "", avatarImageURL: "", homepageURL: "")
    }
}
