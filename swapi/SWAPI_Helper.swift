//
//  SWAPI_Helper.swift
//  swapi
//
//  Created by Cambrian on 2022-09-20.
//

import Foundation

class SWAPI_Helper{
    static private let urlString = "https://swapi.dev/api/people/1";
    
    static private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static public func fetchDir(){
        print(#function)
        guard
            let url = URL(string: urlString)
        else{
            preconditionFailure("was not able to convert string to url: \(urlString)")
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data)
                    
                    guard
                        let jsonDictionary = jsonData as? [AnyHashable: Any],
                        let films = jsonDictionary["films"] as? [String],
                        let name = jsonDictionary["name"] as? String,
                        let height = jsonDictionary["height"] as? String
                    else {
                        preconditionFailure("could not properly parse json Data")
                    }
                    
                    var person = People(name: name, flims: films, height: height)
                    print(person.height)
                }catch let err{
                    print("\(err)")
                }
            } else if let error = error {
                print("error with data task, fetchDir: \(error)")
            } else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
    }
}
