//
//  BaseViewController.swift
//  MyLoveMovie
//
//  Created by HaiPH on 11/11/2024.
//

import Foundation
import SwiftUI

class BaseViewController<Content: View>: BaseHostingViewController<AnyView>, UIGestureRecognizerDelegate {
    
    
    init(rootView: Content) {
        let view = rootView
            .setEnvironment()
            .eraseToAnyView()
        
        super.init(rootView: view)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
