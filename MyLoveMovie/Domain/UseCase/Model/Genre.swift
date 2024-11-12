//
//  Genre.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

struct Genres {
    let movieGenres: [Genre]
    let tvGenres: [Genre]
}

struct Genre: Identifiable, Equatable {
    
    static func ==(lhs: Genre, rhs: Genre) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
}
