//
//  BasicNavigationController.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class BasicNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return AppTheme.statusBarStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }

    private func setupComponents() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = AppTheme.backgroundBar
        navigationBar.tintColor = AppTheme.accentText
        navigationBar.titleTextAttributes = [
            .font: PTRootUI.bold.dynamicallyScalingFont(size: 20),
            .foregroundColor: AppTheme.accentText
        ]
        navigationBar.prefersLargeTitles = false
    }
}
