//
//  ApiWrapper.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

class ApiRepository<T: Codable>: ApiRepositoryProtocol {
    
    private let endPoint: String
    
    private let scheme: String = "https"
    
    init(endPoint: String) {
        self.endPoint = endPoint
    }
    
    func fetchItem(path: String,
                   param: [String : any Codable],
                   needAuthToken: Bool = true) async throws -> T {
        guard Connectivity.isConnectedToInternet else {
            throw CustomError.noInternet
        }
        
        let request = try createGetRequest(from: path, method: .get, param: param, needAuthToken: needAuthToken)
        
        do {
            let result = try await URLSession.shared.data(for: request)
            Logger.log(data: result.0, response: result.1, error: nil)
            
            let response = result.1
            let data = result.0
            
            try handleStatusCode(from: response)
            let decodedObject: T = try decode(from: data)
            return decodedObject
        } catch {
            Logger.log(data: nil, response: nil, error: error)

            if error is CustomError {
                throw error
            } else {
                throw CustomError.serverError
            }
        }
    }
}

extension ApiRepository {
    private func createGetRequest(from path: String,
                                  method: HTTPMethod,
                                  param: [String: any Codable],
                                  needAuthToken: Bool) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = endPoint
        components.path = path
        
        components.queryItems = param
            .map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
        
        guard let safeURL = components.url else {
            throw CustomError.badData
        }
        
        // Form the URL request
        var request = URLRequest(url: safeURL, timeoutInterval: 20.0)
        
        // Specify the http method and allow JSON returns
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        // Add the authorization token if provied
        if needAuthToken {
            if let authToken = try KeychainManager.shared.retrieveToken() {
                request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
            }
        }
        
        Logger.log(request: request)
        // Return the result
        return request
    }
    
    private func handleStatusCode(from response: URLResponse) throws {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw CustomError.serverError
        }
        
        if statusCode == 500 {
            throw CustomError.serverError
        }
        
        if statusCode < 300 {
            return
        }
    }
    
    private func decode<T: Codable>(from data: Data) throws -> T {
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
        } catch let DecodingError.dataCorrupted(context) {
            throw CustomError.customError("\(context.debugDescription) at \(context.codingPath)")
        } catch let DecodingError.keyNotFound(key, context) {
            throw CustomError.customError("Key '\(key)' not found: \(context.debugDescription) at \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            throw CustomError.customError("Value '\(value)' not found: \(context.debugDescription) at \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context)  {
            throw CustomError.customError("Type '\(type)' mismatch: \(context.debugDescription) at \(context.codingPath)")
        } catch {
            throw CustomError.badData
        }
    }
}
