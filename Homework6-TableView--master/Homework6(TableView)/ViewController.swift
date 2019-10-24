//
//  ViewController.swift
//  Homework6(TableView)
//
//  Created by Кирилл Афонин on 18/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // настройка tableView
        tableView.frame = CGRect.init(origin: .zero, size: view.frame.size)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(SigningCell.self, forCellReuseIdentifier: "SigningCell")
        tableView.dataSource = dataSource
        tableView.delegate = tvDelegate

        tvDelegate.navController = navigationController
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
    }

    let tableView = UITableView(frame: .zero, style: .grouped)
    let dataSource = DataSource()
    let tvDelegate = TVDelegate()
}

