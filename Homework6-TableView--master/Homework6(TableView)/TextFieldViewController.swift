//
//  TextFieldViewController.swift
//  Homework6(TableView)
//
//  Created by Кирилл Афонин on 19/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit


class TextFieldViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var indexPath: IndexPath? // индекс ячейки, с которой осуществлялся переход
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTextField()
    }
    
    // если появляется ViewController с tableView, то меняем название в массиве и обновляем таблицу
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {

        if let vc = viewController as? ViewController, self.indexPath != nil {
            vc.dataSource.data[indexPath!.section][indexPath!.row] = textField.text!
            vc.tableView.reloadData()
        }
    }
    
    // настройка textField
    let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    func setupTextField() {
        textField.backgroundColor = .lightGray
        textField.center = view.center
        textField.delegate = self
        view.addSubview(textField)
        textField.becomeFirstResponder()
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        resignFirstResponder()
    }
    
}
