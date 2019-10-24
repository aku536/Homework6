//
//  DataSource.swift
//  Homework6(TableView)
//
//  Created by Кирилл Афонин on 18/10/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    // Названия ячеек, двухмерный массив для разбиения по секциям и строкам
    var data = [["Sign in to your iPhone"],
                        ["General", "Privacy"],
                        ["Passwords & Accounts"],
                        ["Maps", "Safari", "News", "Siri", "Photos", "Game Center"],
                        ["Developer"]]
    
    // Названия изображений
    private let images = [["Sign in to your iPhone"],
                ["General", "Privacy"],
                ["Passwords & Accounts"],
                ["Maps", "Safari", "News", "Siri", "Photos", "Game Center"],
                ["Developer"]]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count // количество массивов = количество секций
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if indexPath.section == 0 {
            cell = SigningCell(style: .subtitle, reuseIdentifier: "SigningCell")
            cell.textLabel?.text = data[indexPath.section][indexPath.row]
            cell.textLabel?.textColor = .blue
            cell.detailTextLabel?.text = "Set up iCloud, the App Store, and more."
            cell.imageView?.image = UIImage(named: "Sign in to your iPhone")
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            let text = data[indexPath.section][indexPath.row]
            cell.textLabel?.text = text
            cell.textLabel?.numberOfLines = 0 // количество строк определяется автоматически
            
            //cell.imageView?.image = UIImage(named: images[indexPath.section][indexPath.row])
            
            // Задаем размер у UIImage
            cell.imageView?.image = imageWithImage(image: UIImage(named: images[indexPath.section][indexPath.row])!, scaledToSize: CGSize(width: 21, height: 21))
            
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    // Создаем изображение заданного размера
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
