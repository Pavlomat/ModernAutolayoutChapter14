//
//  TabBarController.swift
//  ModernAutolayoutChapter14
//
//  Created by Pavlov Matvey on 19.11.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.isTranslucent = false
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: FirstViewController(), title: NSLocalizedString("First", comment: ""), image: UIImage(systemName: "1.circle")!),
            createNavController(for: SecondViewController(), title: NSLocalizedString("Second", comment: ""), image: UIImage(systemName: "2.circle")!),
            createNavController(for: ThirdViewController(), title: NSLocalizedString("Third", comment: ""), image: UIImage(systemName: "3.circle")!),
            createNavController(for: FourthViewController(), title: NSLocalizedString("Fourth", comment: ""), image: UIImage(systemName: "4.circle")!)
        ]
    }
}
