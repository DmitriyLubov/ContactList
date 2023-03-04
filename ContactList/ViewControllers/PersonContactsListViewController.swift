//
//  PersonContactsListViewController.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 04.03.2023.
//

import UIKit

final class PersonContactsListViewController: UITableViewController {
    
    private var personsList: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPersonsList()
    }
}

// MARK: UITableViewDataSource
extension PersonContactsListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        personsList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personsList[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let person = personsList[section]
        
        return (person.phone + person.email).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personContact", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let person = personsList[indexPath.section]
        let text = (person.phone + person.email)[indexPath.row]
        content.text = text
        
        if person.phone.contains(text) {
            content.image = UIImage(systemName: "phone")
        } else {
            content.image = UIImage(systemName: "tray")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: Private Methods
private extension PersonContactsListViewController {
    func setPersonsList() {
        let viewControllers = tabBarController?.viewControllers
        
        viewControllers?.forEach { viewController in
            if let navigationVC = viewController as? UINavigationController {
                let personsVC = navigationVC.topViewController as? PersonsListViewController
                guard let personsVC else { return }
                
                personsList = personsVC.personsList
            }
        }
    }
}
