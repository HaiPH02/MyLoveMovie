//
//  BaseUseCase.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

protocol InputOutputUseCaseProtocol {
    associatedtype Output
    associatedtype Input
    
    func run(input: Input) async throws -> Output
}

