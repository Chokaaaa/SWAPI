//
//  Planets.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 30/08/2023.
//

import Foundation
import SwiftUI


struct PlanetResults : Decodable {
    var results : [Planets]
}


struct Planets : Decodable {
    var name : String
    var diameter : String
    var population : String
    var url : String
    
    enum CodingKeys: String, CodingKey {
        case name, diameter, population, url
    }
}


extension Planets : Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
}
