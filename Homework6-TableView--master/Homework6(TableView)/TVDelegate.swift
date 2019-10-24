//
//  TVDelegate.swift
//  Homework6(TableView)
//
//  Created by Кирилл Афонин on 18/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class TVDelegate: NSObject, UITableViewDelegate {
    
    var navController: UINavigationController? = UINavigationController()
    var textFieldVC = TextFieldViewController()
    
    // Увеличенный размер footer'а для 0 и 3 секции
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 40
        }
        if section == 3 {
            return 40
        }
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    // Настраиваем TextFieldViewController и отображаем его
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        textFieldVC.indexPath = indexPath
        textFieldVC.textField.text = tableView.cellForRow(at: indexPath)?.textLabel?.text
        navController?.delegate = textFieldVC
        navController?.pushViewController(textFieldVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
