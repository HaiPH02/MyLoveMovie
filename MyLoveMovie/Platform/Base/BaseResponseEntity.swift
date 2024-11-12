//
//  BaseResponseEntity.swift
//  MyLoveMovie
//
//  Created by HaiPH on 11/11/2024.
//

import Foundation

enum BaseReponseEntity<T: Codable>: Codable {
    case success(T)
    case failure(FailureEntity)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(T.self) {
            self = .success(x)
            return
        }
        if let x = try? container.decode(FailureEntity.self) {
            self = .failure(x)
            return
        }
        throw DecodingError.typeMismatch(Empty.self,
                                         DecodingError.Context(codingPath: decoder.codingPath,
                                                               debugDescription: "Wrong type for Names"))
    }
    
    public func getData() throws -> T {
        switch self {
        case .success(let t):
            return t
        case .failure(let failureEntity):
            throw CustomError.serverMessage(failureEntity.errorMessage)
        }
    }
}

struct FailureEntity: Codable {
    let code: Int
    let message: String
    
    public enum CodingKeys: String, CodingKey {
        case code = "status_code"
        case message = "status_message"
    }
    
    public var errorMessage: String {
        return "\(code) - \(message)"
    }
}
