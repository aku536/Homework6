//
//  TableViewCells.swift
//  Homework6(TableView)
//
//  Created by Кирилл Афонин on 24/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}

class SigningCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
