//
//  PickerView.swift
//  SWapiMontekrist
//
//  Created by Nursultan Yelemessov on 31/08/2023.
//

import SwiftUI

struct PickerView: View {
    @ObservedObject var viewModel : HomeViewModel
    
    
    @Binding var characters: [Character]
    @Binding var spaceShips: [SpaceShip]
    @Binding var planets: [Planets]
    @Environment(\.isSearching) var isSearching

    var body: some View {
        Picker("", selection: $viewModel.selection) {
            ForEach(PickerSelection.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .padding()
        .onChange(of: isSearching) { newValue in
            if !newValue {
                print("Search canceled")
                self.characters.removeAll()
                self.spaceShips.removeAll()
                self.planets.removeAll()
            }
        }
    }
}
