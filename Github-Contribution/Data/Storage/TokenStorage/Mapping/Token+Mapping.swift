//
//  Token+Mapping.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/16/23.
//

import Foundation
import CoreData

extension TokenEntity {
    convenience init(token: AccessToken, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        self.tokenId = Int16(token.id)
        self.host = token.host
        self.token = token.token
        self.type = Int16(token.type.rawValue)
    }
    
    func toDomain()-> AccessToken {
        .init(id: Int(tokenId), type: VCSType(rawValue: Int(type))!, token: token!, host: host)
    }
}
