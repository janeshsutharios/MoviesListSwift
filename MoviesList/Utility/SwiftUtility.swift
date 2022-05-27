//
//  SwiftUtility.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import Foundation

struct SwiftUtility {
    
   static func loadJson(filename fileName: String) -> Data {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let dataObj = try Data(contentsOf: url)
                return dataObj
            } catch {
                print("error:\(error)")
            }
        }
        return Data()
    }
    
}
