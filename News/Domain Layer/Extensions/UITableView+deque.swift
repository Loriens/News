//
//  UITableView+deque.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell & Reusable>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.reuseIdentifier)")
        }
        return cell
    }
}
