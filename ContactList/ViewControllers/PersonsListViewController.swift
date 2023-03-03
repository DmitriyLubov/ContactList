//
//  PersonsListViewController.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 02.03.2023.
//

import UIKit

class PersonsListViewController: UITableViewController {
    private let personsList = Person.getPersonsList()

}

// MARK: UITableViewDataSource
extension PersonsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = personsList[indexPath.row].fullName
        cell.contentConfiguration = content
        
        return cell
    }
}
