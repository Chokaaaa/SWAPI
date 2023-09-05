//
//  Home.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 28/08/2023.
//

import SwiftUI
import RealmSwift

struct Home: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State private var searchText = ""
    @State var isSearchActive = false
    @State private var characters: [Character] = []
    @State private var spaceCrafts: [SpaceShip] = []
    @State private var planets: [Planets] = []
    @Environment(\.isSearching) var isSearching
    @EnvironmentObject var favoritesViewModel : FavoritesViewModel
    
    
    var body: some View {
        
        NavigationView {
            //MARK: - Search
            VStack {
                //MARK: - Picker
                VStack {
                    PickerView(viewModel: viewModel,  characters: $characters, spaceShips: $spaceCrafts, planets: $planets)
                }
                
                .onChange(of: searchText) { newValue in
                    guard searchText.count >= 2 else {return}
                    self.isSearchActive = true
                    if viewModel.selection == .character {
                        viewModel.getCharacterSearchResults(searchText: newValue) { characters in
                                self.characters = characters
                            self.isSearchActive = false
                        }
                    } else if viewModel.selection == .ship {
                        viewModel.getSpaceShipsSearchResults(searchText: newValue) { spaceship in
                            self.spaceCrafts = spaceship
                            self.isSearchActive = false
                        }
                    } else if viewModel.selection == .planet {
                        viewModel.getPlanetSearchResults(searchText: newValue) { planet in
                            self.planets = planet
                            self.isSearchActive = false
                        }
                    }
                    print("New value is \(newValue)")
                }
                
                if isSearchActive == true {
                    ProgressView()
                } else {
                    List {
                        if viewModel.selection == .character {
                            ForEach(characters, id: \.url) { character in
                                HStack {
                                    VStack {
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
                                    Spacer()
                                    Button {
                                        favoritesViewModel.toggleFavorite(character: character)
                                    } label: {
                                        Image(systemName: favoritesViewModel.favoriteCharacters.contains(character) ? "heart.fill" : "heart")
                                            .foregroundColor(favoritesViewModel.favoriteCharacters.contains(character) ? .red : .gray)
                                    }
                                }

                            }
                        }
                        else if viewModel.selection == .ship {
                            ForEach(spaceCrafts, id: \.url) { craft in
                                HStack {
                                    VStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            HStack {
                                                Text("Name - ")
                                                    .bold()
                                                Text(craft.name)
                                            }
                                            HStack {
                                                Text("Model - ")
                                                    .bold()
                                                Text(craft.model)
                                            }
                                            HStack {
                                                Text("Manufacturer - ")
                                                    .bold()
                                                Text(craft.manufacturer)
                                            }
                                            HStack {
                                                Text("Crew Count - ")
                                                    .bold()
                                                Text(craft.crew)
                                            }
                                        }
                                        .padding(.trailing)
                                    }
                                    Spacer()
                                    Button {
                                        favoritesViewModel.toggleFavoriteSpaceship(spaceShip: craft)
                                    } label: {
                                        Image(systemName: favoritesViewModel.favoriteSpaceShips.contains(craft) ? "heart.fill" : "heart")
                                            .foregroundColor(favoritesViewModel.favoriteSpaceShips.contains(craft) ? .red : .gray)
                                    }
                                }
                            }
                        } else if viewModel.selection == .planet {
                            ForEach(planets, id: \.url) { planet in
                                HStack {
                                    VStack {
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
                                    Spacer()
                                    Button {
                                        favoritesViewModel.toggleFavoritePlanet(planet: planet)
                                    } label: {
                                        Image(systemName: favoritesViewModel.favoritePlanets.contains(planet) ? "heart.fill" : "heart")
                                            .foregroundColor(favoritesViewModel.favoritePlanets.contains(planet) ? .red : .gray)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }
            .searchable(text: $searchText, prompt: "Search")

            
            //MARK: - NavigationTitle
            .navigationBarTitle("Star Wars App")
            
        }
        .padding([.leading, .trailing], 10)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


