//
//  AppNavigator.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation
import UIKit

protocol AppNavigatorProtocol: BaseNavigator {
    var window: UIWindow? { get }
    func setRootViewController()
}

class AppNavigator: AppNavigatorProtocol {
    
    init(window: UIWindow?) {
        self.window = window
        setRootViewController()
    }
    
    var window: UIWindow?
    var navigationController: UINavigationController = UINavigationController()
    
    func setRootViewController() {
        let view = OnboardingView()
        let viewController = BaseViewController(rootView: view)
        
        navigationController.setViewControllers([viewController], animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
