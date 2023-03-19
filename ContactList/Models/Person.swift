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
}

extension Person {
    static func getPersonsList() -> [Person] {
        var personList: [Person] = []
        
        let names = DataStore.shared.names.shuffled()
        let surnames = DataStore.shared.surnames.shuffled()
        let phones = DataStore.shared.phones.shuffled()
        let emails = DataStore.shared.emails.shuffled()
        
        let count = min(names.count, surnames.count, phones.count, emails.count)
        
        for index in 0..<count {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                phone: [phones[index]],
                email: [emails[index]]
            )
            
            personList.append(person)
        }
        
        return personList
    }
}

