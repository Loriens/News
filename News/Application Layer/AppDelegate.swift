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
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setup(application)
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.setup(window)
        
        return true
    }
    
    // MARK: - Application configuration
    private func setup(_ application: UIApplication) { }
    
    // MARK: - Window configuration
    private func setup(_ window: UIWindow) {
        let vc = PostListAssembly.create()
        _ = PostListAssembly.configure(with: vc)
        
        let nc = BasicNavigationController(rootViewController: vc)
        
        self.window = window
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(_ application: UIApplication) { }
    
    func applicationDidEnterBackground(_ application: UIApplication) { }
    
    func applicationWillEnterForeground(_ application: UIApplication) { }
    
    func applicationDidBecomeActive(_ application: UIApplication) { }
    
    func applicationWillTerminate(_ application: UIApplication) { }

}
