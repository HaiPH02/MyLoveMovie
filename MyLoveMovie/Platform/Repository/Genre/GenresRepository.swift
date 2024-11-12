//
//  GenresRepository.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

class GenresRepository: BaseRepository<GenresEntity> {
    override init(endPoint: String) {
        super.init(endPoint: endPoint)
    }
    
    func getMovieGenres(language: String) async throws -> GenresEntity {
        var param = baseParam
        param["language"] = language
        let result = try await dataRepository.fetchItem(path: .movieGenrePath, param: param, needAuthToken: false)
        return try result.getData()
    }
    
    func getTvGenres(language: String) async throws -> GenresEntity {
        var param = baseParam
        param["language"] = language
        let result = try await dataRepository.fetchItem(path: .tvGenrePath, param: param, needAuthToken: false)
        return try result.getData()
    }
}
