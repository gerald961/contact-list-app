//
//  Contact.swift
//  ZIllow Project
//
//  Created by Gerald Akalugwu on 6/13/22.
//

import Foundation

public struct ContactList: Codable {
    var results: [Contact]
}

// Contacts struct
struct Contact: Codable, Identifiable {
    var id = UUID()
    var name: Name
    var location: Location
    var email: String
    var phone: String
    var cell: String
    var picture: Picture
    var nat: String
    
    // Name struct
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    // Location struct
    struct Location: Codable {
        let street: Street
        let city: String
        let state: String
        let country: String
        let postCode: String
        
        struct Street: Codable {
            let number: Int
            let name: String
        }
        
        enum Keys: String, CodingKey {
            case street, city, state, country
            case postcode
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: Keys.self)
            street = try container.decode(Street.self, forKey: .street)
            city = try container.decode(String.self, forKey: .city)
            state = try container.decode(String.self, forKey: .state)
            country = try container.decode(String.self, forKey: .country)
            
            if let postcode = try? container.decode(String.self, forKey: .postcode) {
                self.postCode = postcode
            }
            else if let postcode = try? container.decode(String.self, forKey: .postcode) {
                self.postCode = postcode.description
            }
            else {
                self.postCode = ""
            }
        }
    }
    // Picture struct
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}
