//
//  ResponseDecoder.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/12/23.
//

import Foundation

protocol ResponseDecoder {
    func decode<T: Decodable>(data: Data) throws -> T
}
