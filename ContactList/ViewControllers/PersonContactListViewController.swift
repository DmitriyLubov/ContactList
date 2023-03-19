//
//  PersonContactListViewController.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 04.03.2023.
//

import UIKit

final class PersonContactListViewController: UITableViewController {
    
    var personList: [Person] = []

}

// MARK: UITableViewDataSource
extension PersonContactListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personList[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let person = personList[section]
        
        return (person.phones + person.emails).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personContact", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let person = personList[indexPath.section]
        let text = (person.phones + person.emails)[indexPath.row]
        content.text = text
        
        if person.phones.contains(text) {
            content.image = UIImage(systemName: "phone")
        } else {
            content.image = UIImage(systemName: "tray")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension PersonContactListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
