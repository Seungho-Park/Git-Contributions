//
//  ViewModel.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/7/23.
//

import Foundation

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input)-> Output
}
