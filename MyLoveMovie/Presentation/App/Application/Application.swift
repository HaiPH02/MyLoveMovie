//
//  Application.swift
//  MyLoveMovie
//
//  Created by HaiPH on 11/11/2024.
//

import Foundation

@MainActor
class Application {
    static let shared = Application()
    
    private init() {
        self.internetManager = InternetManager()
        self.genresManager = GenresManager(getGenresUseCase: GetGenresUseCase(genresRepository: GenresRepository(endPoint: "api.themoviedb.org")))
    }
    
    private(set) var internetManager: InternetManager
    private(set) var genresManager: GenresManager
}
