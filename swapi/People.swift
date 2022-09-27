//
//  People.swift
//  swapi
//
//  Created by Cambrian on 2022-09-20.
//

import Foundation

struct People: Codable{
    var name: String
    var films: [String] = []
    var height: String
}
