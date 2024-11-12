//
//  SceneDelegate.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigator: AppNavigator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setAppNavigator(windowScene: scene)
    }
}

extension SceneDelegate {
    private func setAppNavigator(windowScene: UIScene) {
        if let windowScene = windowScene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.makeKeyAndVisible()
            
            navigator = AppNavigator(window: window)
        }
    }
}
