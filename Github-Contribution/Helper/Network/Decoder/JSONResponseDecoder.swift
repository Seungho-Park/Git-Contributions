//
//  JSONResponseDecoder.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/12/23.
//

import Foundation

class JSONResponseDecoder: ResponseDecoder {
    func decode<T: Decodable>(data: Data) throws -> T {
        do {
            let decode = try JSONDecoder().decode(T.self, from: data)
            return decode
        } catch {
            //TODO: Error -
            throw error
        }
    }
}
