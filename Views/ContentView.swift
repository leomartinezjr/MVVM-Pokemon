//
//  ContentView.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/15/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
        
    var body: some View {
        NavigationView{
            Text("Hello, world!")
                .padding()
        }
        .environmentObject(vm)
    }
        
}


#Preview {
    ContentView()
}
