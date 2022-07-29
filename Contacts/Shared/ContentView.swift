//
//  ContentView.swift
//  Shared
//
//  Created by celyes on 29/7/2022.
//

import SwiftUI
import Contacts

struct ContentView: View {
    
    var contactsViewModel = ContactsViewModel()
    
    @State var contacts: [CNContact] = []
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(contacts, id: \.self.givenName) { (contact: CNContact) in
                        
                        VStack(alignment: .leading){
                            Text(contact.givenName).font(.headline)
                            Text(contact.phoneNumbers.first?.value.stringValue ?? "").font(.subheadline)
                        }
                    }
                }.onAppear{
                    DispatchQueue.main.async {
                        contacts = contactsViewModel.getDeviceContacts()
                    }
                }
                .navigationBarTitle(Text("SwiftUI Contacts"))
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
