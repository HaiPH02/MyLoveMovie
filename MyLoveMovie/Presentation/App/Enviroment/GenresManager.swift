//
//  GenresManager.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation

@MainActor
class GenresManager: ObservableObject {
    
    init(getGenresUseCase: GetGenresUseCase) {
        self.getGenresUseCase = getGenresUseCase
    }
    
    
    private let getGenresUseCase: GetGenresUseCase
    
//    private var cancellables = Set<AnyCancellable>()
    
    @Published
    var movieGenres: [Genre] = []
    
    @Published
    var tvGenres: [Genre] = []
    
    func fetchDataFromApi() async {
        do {
            let result = try await getGenresUseCase.run(input: "vn")
            self.movieGenres = result.movieGenres
            self.tvGenres = result.tvGenres
        } catch {
            debugPrint(error)
        }
    }
}


