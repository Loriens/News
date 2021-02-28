//
//  Toast.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import Toast

final class Toast {
    // MARK: - Props
    static let shared = Toast()

    private var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    }
    
    // MARK: - Initialization
    private init() {
        var style = ToastStyle()
        style.backgroundColor = UIColor(hex: "a9a9a9", alpha: 0.7)
        style.cornerRadius = 5.0
        style.displayShadow = true
        style.titleAlignment = .center
        style.messageAlignment = .center
        style.maxWidthPercentage = 0.8
        ToastManager.shared.style = style
        ToastManager.shared.isTapToDismissEnabled = true
        ToastManager.shared.isQueueEnabled = false
        ToastManager.shared.position = .center
        ToastManager.shared.duration = 3.0
    }
    
    // MARK: - Public functions
    func show(title: String?, message: String?) {
        DispatchQueue.main.async {
            self.keyWindow?.makeToast(message, title: title)
        }
    }
    
    func hideAllToasts() {
        DispatchQueue.main.async {
            self.keyWindow?.hideAllToasts()
        }
    }
}
