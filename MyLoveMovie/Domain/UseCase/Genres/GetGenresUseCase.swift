//
//  GetGenresUseCase.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

struct GetGenresUseCase: InputOutputUseCaseProtocol {
    typealias Output = Genres
    typealias Input = String
    
    init(genresRepository: GenresRepository) {
        self.genresRepository = genresRepository
    }
    
    private let genresRepository: GenresRepository
    
    func run(input: String) async throws -> Genres {
        async let movieGenres = genresRepository.getMovieGenres(language: input)
        async let tvGenres = genresRepository.getTvGenres(language: input)
        
        let result = try await (movieGenres, tvGenres)
        
        return Genres(movieGenres: result.0.genres?.compactMap({
            if let id = $0.id, let name = $0.name {
                return Genre(id: id, name: name)
            } else {
                return nil
            }
        }) ?? [],
                      tvGenres: result.1.genres?.compactMap({
            if let id = $0.id, let name = $0.name {
                return Genre(id: id, name: name)
            } else {
                return nil
            }
        }) ?? [])
    }
}
