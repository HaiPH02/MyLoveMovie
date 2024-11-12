//
//  BaseNavigator.swift
//  MyLoveMovie
//
//  Created by HaiPH on 10/11/2024.
//

import Foundation
import UIKit

protocol BaseNavigator {
    var navigationController: UINavigationController { get }
    func dismiss()
    func pop()
}

extension BaseNavigator {
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
}
