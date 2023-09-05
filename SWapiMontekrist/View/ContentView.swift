//
//  ContentView.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var favoritesViewModel = FavoritesViewModel()
    @State private var searchText = ""
    @State private var characters: [Character] = []
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        //MARK: - TabView
        TabView {
            //MARK: - Home Tab
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            //MARK: - Favorites Tab
            FavoritesView()
                .tabItem {
                    
                    Label("Favorites", systemImage: "star")
                }
        }
        .environmentObject(favoritesViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
