//
//  PersonsListViewController.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 02.03.2023.
//

import UIKit

final class PersonsListViewController: UITableViewController {
    let personsList = Person.getPersonsList()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let personVC = segue.destination as? PersonDetailsViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        personVC?.person = personsList[indexPath.row]
    }
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
