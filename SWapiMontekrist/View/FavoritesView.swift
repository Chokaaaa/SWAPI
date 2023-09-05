//
//  FavoritesView.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 31/08/2023.
//

import SwiftUI
import RealmSwift

struct FavoritesView: View {
    @EnvironmentObject var favoritesViewModel : FavoritesViewModel
    var body: some View {
        List {
            //MARK: - Favorite Character Section
                  Section(header: Text("Favorite Characters")) {
                      ForEach(favoritesViewModel.favoriteCharacters, id: \.url) { character in
                          VStack(alignment: .leading, spacing: 5) {
                              HStack {
                                  Text("Name - ")
                                      .bold()
                                  Text(character.name)
                              }
                              HStack {
                                  Text("Gender - ")
                                      .bold()
                                  Text(character.gender)
                              }
                              HStack {
                                  Text("Piloted spaceships - ")
                                      .bold()
                                  Text(String(character.starships.count))
                              }
                          }
                          .padding(.trailing)
                      }
                  }
            //MARK: - Favorite SpaceShip
            Section(header: Text("Favorite SpaceShips")) {
                ForEach(favoritesViewModel.favoriteSpaceShips, id: \.url) { spaceShip in
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Name - ")
                                .bold()
                            Text(spaceShip.name)
                        }
                        HStack {
                            Text("Model - ")
                                .bold()
                            Text(spaceShip.model)
                        }
                        HStack {
                            Text("Manufacturer - ")
                                .bold()
                            Text(spaceShip.manufacturer)
                        }
                        HStack {
                            Text("Crew Count - ")
                                .bold()
                            Text(String(spaceShip.crew))
                        }
                    }
                    .padding(.trailing)
                }
            }
            
            //MARK: - Favorite Planets
            Section(header: Text("Favorite Planets")) {
                ForEach(favoritesViewModel.favoritePlanets, id: \.url) { planet in
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Name - ")
                                .bold()
                            Text(planet.name)
                        }
                        HStack {
                            Text("Diameter - ")
                                .bold()
                            Text(planet.diameter)
                        }
                        HStack {
                            Text("Population - ")
                                .bold()
                            Text(planet.population)
                        }
                    }
                    .padding(.trailing)
                }
            }
              }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesViewModel())
    }
}
