//
//  PersonDetailsViewController.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 03.03.2023.
//

import UIKit

final class PersonDetailsViewController: UIViewController {
    
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailAddressLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        title = person.fullName
        
        phoneNumberLabel.text = person.phones.first
        emailAddressLabel.text = person.emails.first
    }
}
