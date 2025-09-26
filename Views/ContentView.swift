//
//  ContentView.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/15/25.
//

import SwiftUI

struct ContentView: View {
    // Mantido o @StateObject e a variável vm
    @StateObject var vm = ViewModel()
    
    private let adaptativeColumns = [
        GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView{
            // 💡 CORREÇÃO: Envolver o LazyVGrid em um ScrollView
            ScrollView {
                LazyVGrid(columns: adaptativeColumns, spacing: 10) {
                    ForEach(vm.filteredPokemonList) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon))
                        {
                            // Esta view (PokemonView) agora tem espaço garantido para carregar a imagem
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                // Adiciona um padding nas laterais para que o grid não encoste
                .padding(.horizontal)
                .searchable(text: $vm.searchText)
            }
            // Adiciona um título de navegação para melhorar a interface
            .navigationTitle("Pokédex")
        }
        // O environmentObject está aplicado corretamente aqui
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
