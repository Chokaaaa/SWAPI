//
//  SpaceShip.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 30/08/2023.
//

import Foundation
import SwiftUI

struct SpaceShipsResults : Decodable {
    var results : [SpaceShip]
}


struct SpaceShip : Decodable {
    var name : String
    var model : String
    var manufacturer : String
    var crew : String
    var url : String
    
    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer, crew, url
    }
}


extension SpaceShip : Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
}
