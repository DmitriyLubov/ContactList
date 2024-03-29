//
//  TabBarViewController.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 19.03.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let personListVC = viewControllers?.first as? PersonsListViewController
        let personContactVC = viewControllers?.last as? PersonContactListViewController
        
        guard let personListVC else { return }
        guard let personContactVC else { return }
        
        let personList = Person.getPersonsList()
        personListVC.personList = personList
        personContactVC.personList = personList
        print(personList)
    }

}
