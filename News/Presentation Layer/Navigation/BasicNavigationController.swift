//
//  BasicNavigationController.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class BasicNavigationController: UINavigationController {
    
    class func create(with rootController: UIViewController) -> BasicNavigationController {
        let nc = BasicNavigationController(rootViewController: rootController)
        return nc
    }
    
    // MARK: - Props
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return AppTheme.statusBarStyle
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - Setup functions
    private func setupUI() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = AppTheme.backgroundBar
        navigationBar.tintColor = AppTheme.accentText
        navigationBar.titleTextAttributes = [
            .font: PTRootUI.bold.font(size: 20.0),
            .foregroundColor: AppTheme.accentText
        ]
        navigationBar.prefersLargeTitles = false
    }
    
}
