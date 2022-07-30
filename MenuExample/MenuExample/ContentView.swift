//
//  ContentView.swift
//  MenuExample
//
//  Created by celyes on 30/7/2022.
//

import SwiftUI

struct ContentView: View {
    
    var menu: [MenuItem] = []
    
    func extractMenuItemsFromJSON() -> [MenuItem] {
        let jsonUrl = Bundle.main.url(forResource: "menu", withExtension: "json")!
        let jsonData = try! Data(contentsOf: jsonUrl)
        let jsonDecoder = JSONDecoder()
        let menuItems = try! jsonDecoder.decode([MenuItem].self, from: jsonData)
        return menuItems
    }
    
    init() {
        menu = extractMenuItemsFromJSON()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { menuSection in
                    Section(header: Text(menuSection.name)) {
                        ForEach(menuSection.items) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("$ \(item.price)")
                            }
                        }
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Available meals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
