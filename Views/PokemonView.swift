//
//  PokemonView.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/25/25.
//

import SwiftUI


struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimesions: Double = 100 // Tamanho da imagem
    let cellHeight: Double = 140 // Altura total da célula

    // URL computada para fácil depuração
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon:pokemon)).png"
    }

    var body: some View {
        VStack {
            // 💡 LINHA DE DEBUG: Imprima a URL no console para verificar
            let _ = print("Carregando URL: \(imageUrl)")
            
            AsyncImage(url: URL(string: imageUrl)) { phase in
                
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: dimesions, height: dimesions) // Garante o tamanho da imagem
                }
                else if phase.error != nil {
                    // Ícone de debug em caso de falha de URL
                    Image(systemName: "xmark.octagon.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimesions, height: dimesions)
                        .foregroundColor(.red)
                }
                else {
                    // ProgressView (o placeholder)
                    ProgressView()
                        .frame(width: dimesions, height: dimesions) // Garante o tamanho do placeholder
                }
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .lineLimit(1)
        }
        .frame(height: cellHeight) // Garante a altura total da célula no Grid
    }
}
//struct PokemonView: View {
//    @EnvironmentObject var vm: ViewModel
//    let pokemon:Pokemon
//    let dimesions: Double = 140
//    
//    var body: some View {
//        
//        VStack {
//            // USANDO A SINTAXE 'PHASE' CORRETA:
//            
//            
//            
//            
//            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon:pokemon)).png")) { phase in
//                
//               
//                // 1. SUCESSO: A imagem foi carregada (phase.image é um Image?)
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: dimesions, height: dimesions)
//                }
//                // 2. ERRO: Ocorreu um erro
//                else if phase.error != nil {
//                    Image(systemName: "xmark.octagon.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: dimesions, height: dimesions)
//                    
//                }
//                // 3. CARREGANDO: Caso contrário, mostra o ProgressView (placeholder)
//                else {
//                    ProgressView()
//                        .frame(width: dimesions, height: dimesions)
//                }
//            } // <--- O bloco 'placeholder: {}' FOI REMOVIDO AQUI
//            .background(.thinMaterial)
//            .clipShape(Circle())
//            
//            Text("\(pokemon.name.capitalized)")
//                .font(.system(size: 16, weight: .regular, design: .monospaced))
//                .padding(.bottom,20)
//        }
//    }
//}

#Preview {
    PokemonView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
