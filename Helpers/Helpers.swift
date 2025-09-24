//
//  Helpers.swift
//  MVVM Pokemon
//
//  Created by Luana Martinez de la Flor on 9/15/25.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(from file: String ) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Aquivo \(file) nao encontrado no bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError( "Nao foi possivel decodificar o arquivo \(file)")
            
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError( "Nao foi possivel decodificar o arquivo \(file)")
            
        }
        return loadedData
        
    }
    
    func fetchData<T: Decodable >(url: String, model: T.Type, completion:@escaping(T) -> (),
                                  failure: @escaping (Error) -> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
                
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
        
    }
    
    
    
}






