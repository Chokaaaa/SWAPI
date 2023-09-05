//
//  HomeViewModel.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 29/08/2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var selection : PickerSelection = .character
    
    init() {
        
    }
    
    func getPlanetSearchResults(searchText : String = "", completion: @escaping (_ spaceship: [Planets]) -> Void) {
        guard let url = URL(string: "https://swapi.dev/api/planets/?search=\(searchText)") else {
//        guard let url = URL(string: "https://swapi.dev/api/?search=\(searchText)") else {
            
            print("Invalid URL spaceShip")
            completion([Planets]())
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("SpaceShip error is \(error.localizedDescription)")
                completion([Planets]())
                return
            }
            
            guard let data = data else {
                print("invalid DATA")
                return
            }
            
            guard let worldResults = try? JSONDecoder().decode(PlanetResults.self, from: data) else {
                print("Something went wrong")
                completion([Planets]())
                return
            }
            print("space ship results \(worldResults)")
            completion(worldResults.results)
        }
        .resume()
    }
    
    func getSpaceShipsSearchResults(searchText : String = "", completion: @escaping (_ spaceship: [SpaceShip]) -> Void) {
        guard let url = URL(string: "https://swapi.dev/api/starships/?search=\(searchText)") else {
//        guard let url = URL(string: "https://swapi.dev/api/?search=\(searchText)") else {
            
            print("Invalid URL spaceShip")
            completion([SpaceShip]())
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("SpaceShip error is \(error.localizedDescription)")
                completion([SpaceShip]())
                return
            }
            
            guard let data = data else {
                print("invalid DATA")
                return
            }
            
            guard let spaceShipResults = try? JSONDecoder().decode(SpaceShipsResults.self, from: data) else {
                print("Something went wrong")
                completion([SpaceShip]())
                return
            }
            print("space ship results \(spaceShipResults)")
            completion(spaceShipResults.results)
        }
        .resume()
    }
    
    func getCharacterSearchResults(searchText : String = "", completion: @escaping (_ characters: [Character]) -> Void)  {
        guard let url = URL(string: "https://swapi.dev/api/people/?search=\(searchText)") else {
//        guard let url = URL(string: "https://swapi.dev/api/?search=\(searchText)") else {
            
            print("Invalid URL")
            completion([Character]())
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error is \(error.localizedDescription)")
                completion([Character]())
                return
            }
            
            guard let data = data else {
                print("invalid DATA")
                return
            }
            
            guard let charactersResults = try? JSONDecoder().decode(CharacterResults.self, from: data) else {
                completion([Character]())
                return
            }
            print("Character results \(charactersResults)")
            completion(charactersResults.results)
        }
        .resume()
        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error is \(error.localizedDescription)")
//                return
//            }
//            guard let data = data else {
//                print("invalid DATA")
//                return
//            }
//            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else {
//                print("invalid JSON")
//                return
//            }
//
//            print(json)
//        }.resume()
    }
}
