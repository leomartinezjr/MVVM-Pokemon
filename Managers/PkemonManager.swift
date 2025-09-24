//
//  PkemonManager.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/16/25.
//

import Foundation

class PokemonManager {
    func getPokemons() -> [Pokemon]{
        let data: PokemonPage = Bundle.main.decode(from: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
        
    }
    func getPokemonDetail (id: Int, _ completion:@escaping (DetailPokemon)->()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) {
            data in completion(data) } failure: { error in
                print(error)
                
            }
    }
    
    
}



