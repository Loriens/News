//
//  PostListDataSource.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostListDataSource: UITableViewDiffableDataSource<PostListModule.Section, PostListModule.Item> {
    init(tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, item -> UITableViewCell? in
            switch item {
            case let .post(cellViewModel):
                let cell = tableView.dequeue(PostListCell.self, for: indexPath)
                cell.update(with: cellViewModel)
                return cell
            }
        }
        tableView.registerCellClass(PostListCell.self)
    }
}
