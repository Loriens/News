//
//  AppDelegate.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - UIApplicationDelegate
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setup(application)
        let window = UIWindow(frame: UIScreen.main.bounds)
        setup(window)
        
        return true
    }
    
    // MARK: - Application configuration
    private func setup(_ application: UIApplication) { }
    
    // MARK: - Window configuration
    private func setup(_ window: UIWindow) {
        let configurator = PostListConfigurator()
        let vc = configurator.create()
        let nc = BasicNavigationController(rootViewController: vc)
        
        self.window = window
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
}
