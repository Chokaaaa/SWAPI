//
//  Favorite.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 31/08/2023.
//

import Foundation
import RealmSwift


class FavoriteCharacter : Object {
    @Persisted(primaryKey: true) var url: String
    @Persisted var name = ""
    @Persisted var gender = ""
    @Persisted var starShips : List<String>
}

class FavoriteSpaceShip : Object {
    @Persisted(primaryKey: true) var url: String
    @Persisted var name = ""
    @Persisted var model = ""
    @Persisted var manufacturer = ""
    @Persisted var crew = ""
}


class FavoritePlanet : Object {
    @Persisted(primaryKey: true) var url: String
    @Persisted var name = ""
    @Persisted var diameter = ""
    @Persisted var population = ""
}

