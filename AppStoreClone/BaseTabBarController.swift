//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by Аслан on 02/10/2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TabBar loaded")
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Apps"
       // redViewController.tabBarItem.title = "Red"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Red Nav"
        redNavController.tabBarItem.image = UIImage(named: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Search"
        blueViewController.tabBarItem.title = "Blue"
        blueViewController.tabBarItem.image = UIImage(named: "search")
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Blue Nav"
        blueNavController.navigationBar.prefersLargeTitles = true
        
       // tabBar.barTintColor = .gray
        
        viewControllers = [
            redNavController,
            blueNavController
        ]
    }
}
