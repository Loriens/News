//
//  Toast.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit
import Toast

class Toast {
    
    static let shared: Toast = Toast()
    
    private init() {
        var style = ToastStyle()
        style.messageColor = .white
        style.backgroundColor = UIColor(hex: "a9a9a9", alpha: 0.7)
        style.cornerRadius = 5.0
        style.displayShadow = true
        style.titleAlignment = .center
        style.messageAlignment = .center
        style.maxWidthPercentage = 0.8
        ToastManager.shared.style = style
        ToastManager.shared.isTapToDismissEnabled = true
        ToastManager.shared.isQueueEnabled = false
    }
    
    func show(title: String?, message: String?) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.makeToast(message, duration: 3.0, position: .center, title: title, image: nil, style: ToastManager.shared.style, completion: nil)
        }
    }
    
    func show(title: String?, message: String?, duration: Double) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.makeToast(message, duration: duration, position: .center, title: title, image: nil, style: ToastManager.shared.style, completion: nil)
        }
    }
    
    func hideAllToasts() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.hideAllToasts()
        }
    }
    
}
