//
//  ViewDidLoadModifier.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    
    @State
    private var isFirstTime = true
    
    @EnvironmentObject
    var internetManager: InternetManager
    
    let initState: AsyncVoidCallback
    
    
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                Task { @MainActor in
                    if !internetManager.isConnectedToInternet {
                        return
                    }
                    
                    if isFirstTime {
                        isFirstTime = false
                        await initState()
                    }
                }
            })
            .onChange(of: internetManager.isConnectedToInternet) { _, isHavingInternet in
                guard isHavingInternet else { return }
                Task { @MainActor in
                    await initState()
                }
            }
    }
}
