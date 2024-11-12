//
//  BaseHostingViewController.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation
import SwiftUI

class BaseHostingViewController<Content>: UIHostingController<AnyView> where Content: View {
    init(rootView: Content) {
        super.init(rootView: AnyView(rootView))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
