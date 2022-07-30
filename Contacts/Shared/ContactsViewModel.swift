//
//  ContactsViewModel.swift
//  ContactsExample
//
//  Created by Ilyes Chouia on 29/7/2022.
//

import Foundation
import Contacts

class ContactsViewModel {
    
    private var contacts: [CNContact] = []

    func getDeviceContacts() -> [CNContact] {
        
        // 1. initialize a contact store...
        let store = CNContactStore()
        
        // 2. request the user to give access...
        store.requestAccess(for: .contacts, completionHandler: { (granted, error) in
            
            if granted {
                // 3. if the user agrees to give us access, define what keys you'll be fetching...
                
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                // 4. Order by contact given name
                request.sortOrder = .givenName
                
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        // 5. select only contacts with phone numbers...
                        if (contact.phoneNumbers.first?.value.stringValue) != nil {
                            self.contacts.append(contact)
                        }
                    })
                    
                } catch let error {
                    print("Failed to fetch contacts...", error)
                }
            } else {
                print("Permission denied!")
            }
    
        })
        return self.contacts
    }
}
