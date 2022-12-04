//
//  ContentView.swift
//  ZIllow Project
//
//  Created by Gerald Akalugwu on 6/13/22.
//

import SwiftUI

struct ContentView: View {
    @State var contacts = [Contact]()
    var contactService = ContactService()
    var nationalityStore = NationalityStore()
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(contacts) { contact in
                    // VStack for each contact profile
                    VStack {
                        // HStack separating picture and name
                        HStack(spacing: 24) {
                            AsyncImage(url: URL(string: contact.picture.thumbnail)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                
                            } placeholder: {
                                Text("Image could not load")
                            }
                            .frame(width: 42, height: 42)
                            .overlay(alignment: .bottomTrailing) {
                                Text(nationalityStore.nationalityList[contact.nat]?.emoji ?? "")
                                    .offset(x: 9, y: 5)
                            }
                            // VStack separating name and email
                            VStack {
                                // HStack for name and spacer after the name
                                HStack {
                                    Text(contact.name.first + " " + contact.name.last)
                                    Spacer()
                                }
                                // HStack for name and spacer after the name
                                HStack {
                                    Text(contact.email)
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 10, leading: 20, bottom: 10, trailing: 0))
                    
                }
            }
            .navigationTitle("Contacts")
            .listStyle(.plain)

        }
        .onAppear {
            nationalityStore.load()
            Task {
                do {
                    let result = try await contactService.loadContacts()
                    self.contacts = result.results
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

