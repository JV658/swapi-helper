//
//  pokeAPI_Helper.swift
//  swapi
//
//  Created by Cambrian on 2022-09-20.
//

import Foundation

class PokeAPI_Helper{
    static private let urlString = "https://pokeapi.co/api/v2/"
    
    static func fetchDir(){
        guard
            let url = URL(string: urlString)
        else{
            preconditionFailure("was not able to convert string to url: \(urlString)")
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data)
                    print(jsonObject)
                } catch let err {
                    print(err)
                }
            } else if let error = error {
                print("there was an error when fetching the information: \(error)")
            } else {
                print("unknown error")
            }
        }
        task.resume()
    }
}
