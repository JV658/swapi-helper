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
    
    //create a callback parameter
    static public func fetchDir(callback: @escaping (People)->Void){
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
                    let decoder = JSONDecoder()
                    
                    let results = try decoder.decode(People.self, from: data)
                    
                    callback(results)
                    
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
    
    
    static public func fetchDir() async -> People?{
        guard
            let url = URL(string: urlString)
        else{
            preconditionFailure("was not able to convert string to url: \(urlString)")
        }
        
        let request = URLRequest(url: url)
        do{
            let (data, response) = try await session.data(for: request)
            let decoder = JSONDecoder()
            print(response)
            return try decoder.decode(People.self, from: data)
        } catch let err {
            print("error: \(err)")
            return nil
        }
    }
}
