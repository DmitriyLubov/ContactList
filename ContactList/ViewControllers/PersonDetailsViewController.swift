//
//  PersonDetailsViewController.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 03.03.2023.
//

import UIKit

final class PersonDetailsViewController: UIViewController {
    var person: Person!
    
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailAddressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        title = person.fullName
        
        phoneNumberLabel.text = person.phone.first
        emailAddressLabel.text = person.email.first
    }
}
