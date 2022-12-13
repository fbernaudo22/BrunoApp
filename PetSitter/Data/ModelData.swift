//
//  ModelData.swift
//  Dogsitter
//
//  Created by Francesco Bernaudo on 06/12/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var petsitters: [petSitter] = load("dogsitterData.json")
    @Published var user: User = User.init()
}

func load<T: Decodable>(_ filename: String)->T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't not find the \(filename) in Main Bundle")
    }
    do {
        try data = Data(contentsOf: file)
    }
    catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    
}
