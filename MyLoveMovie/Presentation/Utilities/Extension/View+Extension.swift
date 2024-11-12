//
//  View+Extension.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation
import SwiftUI

extension View {
    
    @MainActor
    func setEnvironment() -> some View {
        self
            .environmentObject(Application.shared.internetManager)
            .environmentObject(Application.shared.genresManager)
    }
    
    @ViewBuilder
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    @ViewBuilder
    func viewDidLoad(initState: @escaping AsyncVoidCallback)-> some View {
        self
            .modifier(ViewDidLoadModifier(initState: initState))
    }
}
