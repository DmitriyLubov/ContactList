//
//  Person.swift
//  ContactList
//
//  Created by Дмитрий Лубов on 02.03.2023.
//

struct Person {
    let name: String
    let surname: String
    
    let phone: [String]
    let email: [String]
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPersonsList() -> [Person] {
        let personData = DataStore()
        
        let fullNames = zip(
            personData.names.shuffled(),
            personData.surnames.shuffled()
        )
        let contactData = zip(
            personData.phones.shuffled(),
            personData.emailAddresses.shuffled()
        )
        
        var personsList: [Person] = []
        
        for (fullName, contact) in zip(fullNames, contactData) {
            let (name, surname) = fullName
            let (phone, email) = contact
            
            personsList.append(Person(
                name: name,
                surname: surname, 
                phone: [phone],
                email: [email]
            ))
        }
        
        return personsList
    }
}

