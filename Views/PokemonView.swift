//
//  PokemonView.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/25/25.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon:Pokemon
    let dimesions: Double = 140
    
    var body: some View {
        
        VStack {
            // USANDO A SINTAXE 'PHASE' CORRETA:
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon:pokemon)).png")) { phase in
                
                // 1. SUCESSO: A imagem foi carregada (phase.image é um Image?)
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: dimesions, height: dimesions)
                }
                // 2. ERRO: Ocorreu um erro
                else if phase.error != nil {
                    Image(systemName: "xmark.octagon.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimesions, height: dimesions)
                }
                // 3. CARREGANDO: Caso contrário, mostra o ProgressView (placeholder)
                else {
                    ProgressView()
                        .frame(width: dimesions, height: dimesions)
                }
            } // <--- O bloco 'placeholder: {}' FOI REMOVIDO AQUI
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom,20)
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
