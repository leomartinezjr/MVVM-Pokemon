//
//  ViewModel.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/15/25.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetail: DetailPokemon?
    @Published var searchText: String = ""
    
    var filteredPokemonList: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter{
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemons()
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int? {
        if let index = pokemonList.firstIndex(of: pokemon) {
            return index + 1
            
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetail = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getPokemonDetail(id: id!) {data in
            
            DispatchQueue.main.async {
                self.pokemonDetail = data
            }
        }
    }
    
    func formatHW(value: Int)-> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue/10)
        
        return string
    }
    
    
    
}
