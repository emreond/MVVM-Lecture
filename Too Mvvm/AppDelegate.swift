//
//  AppDelegate.swift
//  Too Mvvm
//
//  Created by Emre on 7.12.2019.
//  Copyright © 2019 Emre. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let splashController = UINavigationController(rootViewController: MainViewController())
        
        self.window?.rootViewController = splashController
        return true
    }
    
}

