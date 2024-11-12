//
//  GenreEntity.swift
//  MyLoveMovie
//
//  Created by HaiPH on 11/11/2024.
//

import Foundation

// MARK: - Genres
public struct GenresEntity: Codable {
    public let genres: [GenreEntity]?
}

// MARK: - Genre
public struct GenreEntity: Codable {
    public let id: Int?
    public let name: String?
}
