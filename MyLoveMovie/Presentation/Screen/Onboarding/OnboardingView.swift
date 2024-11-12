//
//  OnboardingView.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject
    var genresManager: GenresManager
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .viewDidLoad {
                await genresManager.fetchDataFromApi()
            }
    }
}

#Preview {
    OnboardingView()
}
