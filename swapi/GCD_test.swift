//
//  GCD_test.swift
//  swapi
//
//  Created by Cambrian on 2022-09-27.
//

import Foundation

//func changeBool(callback: @escaping (Bool) -> Void){
//    DispatchQueue(label: "someQueue").async {
//        for _ in 0...100000000{
//            continue
//        }
//
//        callback(true)
//    }
//}

func changeBool() async -> Bool {
    for _ in 0...10000000{
        continue
    }
    return true
}
