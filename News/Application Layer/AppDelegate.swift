//
//  AppDelegate.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import DesignSystem

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup(application)
        let window = UIWindow(frame: UIScreen.main.bounds)
        setup(window)
        return true
    }

    private func setup(_ application: UIApplication) { }

    private func setup(_ window: UIWindow) {
        let configurator = PostListFactory()
        let vc = configurator.create()
        let nc = UINavigationController(navigationBarClass: NavigationBar.self, toolbarClass: nil)
        (nc.navigationBar as? NavigationBar)?.applyStyle(.basic)
        nc.viewControllers = [vc]
        self.window = window
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
}
