//
//  ViewModel.swift
//  SharedUI
//
//  Created by 박승호 on 1/11/25.
//

public protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input)-> Output
}
