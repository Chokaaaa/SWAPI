//
//  Character.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 28/08/2023.
//

import Foundation
import SwiftUI

struct CharacterResults : Decodable {
    var results : [Character]
}

struct Character: Decodable {
    let name: String
    let gender: String
    var starships: [String]
    let url: String
    
    
    enum CodingKeys: String, CodingKey {
        case name, gender, starships, url
    }

}

extension Character : Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
    
}


