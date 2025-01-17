//
//  DataTransferService.swift
//  CoreNetwork
//
//  Created by 박승호 on 1/17/25.
//  Copyright © 2025 Seungho-Park. All rights reserved.
//

import Foundation

public protocol DataTransferService {
    
    func request<E: ResponseRequestable, T: Decodable>(with endpoint: E, completion: @escaping (Result<T, DataTransferError>)-> Void)-> URLSessionTask? where E.Response == T
    func request<E: ResponseRequestable>(with endpoint: E, completion: @escaping (Result<Void, DataTransferError>)-> Void)-> URLSessionTask? where E.Response == Void
    
    func request<E: ResponseRequestable, T: Decodable>(with endpoint: E)-> Task<T, Error> where E.Response == T
    func request<E: ResponseRequestable>(with endpoint: E)-> Task<Void, Error> where E.Response == Void
}
