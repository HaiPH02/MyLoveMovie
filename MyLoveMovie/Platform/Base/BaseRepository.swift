//
//  BaseRepository.swift
//  MyLoveMovie
//
//  Created by HaiPH on 11/11/2024.
//

import Foundation

class BaseRepository<Data: Codable> {
    
    init(endPoint: String) {
        self.endPoint = endPoint
    }
    
    var endPoint: String
    
    lazy var dataRepository = ApiRepository<BaseReponseEntity<Data>>(endPoint: endPoint)
    
    var baseParam = ["api_key": String.key]
}
