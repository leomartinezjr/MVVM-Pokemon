//
//  PokemonDetailView.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/18/25.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    
    var body: some View {
        //PokemonView
        
        VStack(spacing:10){
            
            PokemonView(pokemon:pokemon )
            
            
            Text("**ID**: \(vm.pokemonDetail?.id ?? 0 )")
            Text("**Peso**: \(vm.formatHW(value: vm.pokemonDetail?.weight ?? 0)) kg")
            Text("**Altura**: \(vm.formatHW(value: vm.pokemonDetail?.height ?? 0)) Metros")
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
