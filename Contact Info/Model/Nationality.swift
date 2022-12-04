//
//  Nationality.swift
//  ZIllow Project
//
//  Created by Gerald Akalugwu on 6/23/22.
//

import Foundation
import SwiftUI

class NationalityStore {
    
    var nationalityList = [String: Nat]()
    
    func load () {
        guard let data = JsonLoader.readLocalJSONFile(forName: "NatList")
        else {
            return
        }
        parseNationalityData(json: data)
    }
    
    private func parseNationalityData(json: Data) {
        do {
            let natList = try JSONDecoder().decode([Nat].self, from: json)
            for nat in natList {
                self.nationalityList[nat.code] = nat
            }
        }
        catch {
            print("Error")
        }
    }
}

struct Nat: Codable {
    let name: String
    let code: String
    let emoji: String
    let unicode: String
    let image: String
}
