//
//  Token+Mapping.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData

extension Token {
    convenience init(token: AccessToken, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = Int32(token.id)
        self.host = token.host
        self.token = token.token
        self.type = Int32(token.type.rawValue)
    }
    
    func toDomain()-> AccessToken {
        .init(id: Int(id), type: VCSType(rawValue: Int(type))!, token: token!, host: host)
    }
}
