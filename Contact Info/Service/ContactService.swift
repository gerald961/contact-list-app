//
//  ContactService.swift
//  ZIllow Project
//
//  Created by Gerald Akalugwu on 6/14/22.
//

import Foundation

class ContactService {
    private var session = URLSession.shared

    func loadContacts() async throws -> ContactList {
        let url = URL(string: "https://randomuser.me/api/1.3/?results=30&nat=us,fr,ca,au&seed=foo")!
        let(data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(ContactList.self, from: data)
    }
}
