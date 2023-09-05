//
//  RealmManager.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 31/08/2023.
//

import Foundation
import RealmSwift

class RealmManager : ObservableObject {
    static let shared = RealmManager()
    private var realm: Realm!
    
    
    private init() {
          do {
              realm = try Realm()
          } catch {
              print("Error initializing Realm: \(error)")
          }
      }
      
    //MARK: - Adding Object of Favorite Character
    func addObject(character : Character) {
        let favCharacter = FavoriteCharacter(value: ["name": character.name, "gender" : character.gender, "url" : character.url, "starships" : character.starships] as [String : Any])
          do {
              try realm.write {
                  realm.add(favCharacter)
                  print("Favorite Character added to Realm \(favCharacter)")
              }
          } catch {
              print("Error adding object to Realm: \(error)")
          }
      }
    
    //MARK: - Adding Object of Favorite SpaceShip
    func addSpaceShipObject(spaceShip: SpaceShip) {
        let favSpaceShip = FavoriteSpaceShip(value: ["name" : spaceShip.name, "model" : spaceShip.model, "url" : spaceShip.url, "manufacturer" : spaceShip.manufacturer, "crew" : spaceShip.crew] as [String : Any])
          do {
              try realm.write {
                  realm.add(favSpaceShip)
                  print("Favorite SpaceShip added to Realm \(favSpaceShip)")
              }
          } catch {
              print("Error adding object to Realm: \(error)")
          }
      }
    
    //MARK: - Adding Object of Favorite Planet
    func addPlanetObject(planet: Planets) {
        let favPlanet = FavoritePlanet(value: ["name" : planet.name, "url" : planet.url, "diameter" : planet.diameter, "population" : planet.population])
          do {
              try realm.write {
                  realm.add(favPlanet)
                  print("Favorite Planet added to Realm \(favPlanet)")
              }
          } catch {
              print("Error adding object to Realm: \(error)")
          }
      }
    
    
    //MARK: - Checking Object and deleting if exist (Character Object)
    func toggleFavorite(character : Character) -> Bool {
        if let realm = realm {
            if let specificCharacter = realm.object(ofType: FavoriteCharacter.self, forPrimaryKey: character.url) {
                try! realm.write {
                    realm.delete(specificCharacter)
                }
                return false
            } else {
//                let favCharacter = FavoriteCharacter(value: ["name": character.name, "gender" : character.gender, "url" : character.url, "starships" : character.starships] as [String : Any])
                let favCharacter = FavoriteCharacter()
                favCharacter.name = character.name
                favCharacter.gender = character.gender
                favCharacter.url = character.url
                for starship in character.starships {
                    favCharacter.starShips.append(starship)
                }
                do {
                    try realm.write {
                        realm.add(favCharacter)
                        print("Favorite Character added to Realm \(favCharacter)")
                    }
                    return true
                } catch {
                    print("Error adding object to Realm: \(error)")
                    return false
                }
            }
        }
        return false
    }
    
    //MARK: - Checking Object and deleting if exist (SpaceShip Object)
    func toggleFavoriteSpaceship(spaceShip: SpaceShip) -> Bool {
        if let realm = realm {
            if let specificSpaceShip = realm.object(ofType: FavoriteSpaceShip.self, forPrimaryKey: spaceShip.url) {
                try! realm.write {
                    realm.delete(specificSpaceShip)
                }
                return false
            } else {
                let favSpaceShip = FavoriteSpaceShip(value: ["name" : spaceShip.name, "model" : spaceShip.model, "url" : spaceShip.url, "manufacturer" : spaceShip.manufacturer, "crew" : spaceShip.crew] as [String : Any])
                do {
                    try realm.write {
                        realm.add(favSpaceShip)
                        print("Favorite Character added to Realm \(favSpaceShip)")
                        return true
                    }
                } catch {
                    print("Error adding object to Realm: \(error)")
                    return false
                }
            }
        }
        return false
    }
    
    //MARK: - Checking Object and deleting if exist (Planet Object)
    func toggleFavoritePlanet(planet: Planets) -> Bool {
        if let realm = realm {
            if let specificPlanet = realm.object(ofType: FavoritePlanet.self, forPrimaryKey: planet.url) {
                try! realm.write {
                    realm.delete(specificPlanet)
                }
                return false
            } else {
                let favPlanet = FavoritePlanet(value: ["name" : planet.name, "url" : planet.url, "diameter" : planet.diameter, "population" : planet.population])
                do {
                    try realm.write {
                        realm.add(favPlanet)
                        print("Favorite Character added to Realm \(favPlanet)")
                        return true
                    }
                } catch {
                    print("Error adding object to Realm: \(error)")
                    return false
                }
            }
        }
        return false
    }
    
    //MARK: - Reading all Objects
    func getCharacterFavorites() -> [FavoriteCharacter] {
        if let realm = realm {
            //MARK: - Characters
            let existingCharacters = realm.objects(FavoriteCharacter.self)
            return Array(existingCharacters)
        }
        return []
    }
    
    func getStarShipFavorites() -> [FavoriteSpaceShip] {
        if let realm = realm {
            let existingSpaceShip = realm.objects(FavoriteSpaceShip.self)
            return Array(existingSpaceShip)
        }
        return []
    }
    
    func getPlanetFavorites() -> [FavoritePlanet] {
        if let realm = realm {
            //MARK: - Characters
            let existingPlanet = realm.objects(FavoritePlanet.self)
            return Array(existingPlanet)
        }
        return []
    }
    
}
