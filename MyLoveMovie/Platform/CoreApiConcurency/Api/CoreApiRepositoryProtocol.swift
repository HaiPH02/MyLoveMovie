//
//  CoreApiRepositoryProtocol.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

protocol ApiRepositoryProtocol {
    associatedtype T
    
    func fetchItem(path: String,
                   param: [String: any Codable],
                   needAuthToken: Bool) async throws -> T
}
