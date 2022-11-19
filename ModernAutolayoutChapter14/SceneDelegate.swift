//
//  SceneDelegate.swift
//  ModernAutolayoutChapter14
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .white
        let rootviewController = TabBarController()
//        rootviewController.title = NSLocalizedString("Adapt Stack", comment: "Adapt Stack")
//        let navigationController = UINavigationController(rootViewController: rootviewController)
//        navigationController.navigationBar.isTranslucent = false
        window?.rootViewController = rootviewController
        window?.makeKeyAndVisible()
    }
}

