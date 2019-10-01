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
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .red
       // redViewController.tabBarItem.title = "Red"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Red Nav"
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .blue
       // blueViewController.tabBarItem.title = "Blue"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Blue Nav"
        
        viewControllers = [
            redNavController,
            blueNavController
        ]
    }
}
