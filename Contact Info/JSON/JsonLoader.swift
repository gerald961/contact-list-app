//
//  JsonLoader.swift
//  ZIllow Project
//
//  Created by Gerald Akalugwu on 6/24/22.
//

import Foundation

class JsonLoader {
    static func readLocalJSONFile(forName resource: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: resource, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
