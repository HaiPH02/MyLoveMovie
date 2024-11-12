//
//  Connectivity.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation
import Alamofire

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()
    
    static var isConnectedToInternet: Bool {
        if let sharedInstance = sharedInstance {
            return sharedInstance.isReachable
        }
        
        return false
    }
}
