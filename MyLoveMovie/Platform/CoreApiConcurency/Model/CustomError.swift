//
//  CustomError.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

enum CustomError: Error {
    case thrownError(Error)
    case customError(String)
    case serverMessage(String)
    case noInternet
    case badData
    case expiredToken
    case serverError
}
