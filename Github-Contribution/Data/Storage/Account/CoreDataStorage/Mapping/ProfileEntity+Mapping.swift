//
//  ProfileEntity+Mapping.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/13/23.
//

import Foundation
import CoreData

extension ProfileEntity {
    convenience init(profile: Profile, context: NSManagedObjectContext) {
        self.init(context: context)
    }
}
