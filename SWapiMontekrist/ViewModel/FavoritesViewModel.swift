//
//  FavoritesViewModel.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 04/09/2023.
//

import Foundation
import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Published var favoriteCharacters: [Character] = []
    @Published var favoriteSpaceShips: [SpaceShip] = []
    @Published var favoritePlanets: [Planets] = []
    
    init() {
        let localFavoriteCharacters = RealmManager.shared.getCharacterFavorites()
        favoriteCharacters = localFavoriteCharacters.map {
            Character(name: $0.name, gender: $0.gender, starships: Array($0.starShips), url: $0.url)
        }
        
        let localFavoriteSpaceShip = RealmManager.shared.getStarShipFavorites()
        favoriteSpaceShips = localFavoriteSpaceShip.map {
            SpaceShip(name: $0.name, model: $0.model, manufacturer: $0.manufacturer, crew: $0.crew, url: $0.url)
        }
        
        let localFavoritePlanet = RealmManager.shared.getPlanetFavorites()
        favoritePlanets = localFavoritePlanet.map {
            Planets(name: $0.name, diameter: $0.diameter, population: $0.population, url: $0.url)
        }
        
    }
    
    func toggleFavorite(character: Character) {
        if RealmManager.shared.toggleFavorite(character : character) {
            favoriteCharacters.append(character)
            print("Added favorite character")
        } else {
            favoriteCharacters.removeAll { querryCharacter in
                querryCharacter.url == character.url
            }
            print("Removed favorite character")
        }
    }
    
    func toggleFavoriteSpaceship(spaceShip: SpaceShip) {
        if RealmManager.shared.toggleFavoriteSpaceship(spaceShip: spaceShip) {
            favoriteSpaceShips.append(spaceShip)
        } else {
            favoriteSpaceShips.removeAll { querrySpaceShip in
                querrySpaceShip.url == spaceShip.url
            }
        }
    }
    
    func toggleFavoritePlanet(planet: Planets) {
        if RealmManager.shared.toggleFavoritePlanet(planet: planet) {
            favoritePlanets.append(planet)
        } else {
            favoritePlanets.removeAll { querryPlanet in
                querryPlanet.url == planet.url
            }
        }
    }
    
}
