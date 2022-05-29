//
//  NetworkHelper.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import UIKit
import Foundation
import AVFoundation

struct NetworkHelperConstants {
    static let apiKey = "2f517f01f411d57f006a2a77c458eafc"
    static let baseURL = "https://api.themoviedb.org/"
    static let imgBaseURL = "https://image.tmdb.org/t/p/w500/"
    
    static let movieListURL = baseURL + "4/list/1" + "?api_key=\(apiKey)"
    static let movieDetailURL = baseURL + "3/movie/"
    
    
}

protocol APIServiceProtocol {
    func startNetworkTask(urlStr:String, params:[String:Any], resultHandler: @escaping (Result<Data?, Error>) -> Void)
}

class NetworkHelper:APIServiceProtocol {
    static let shared = NetworkHelper()
    
    func startNetworkTask(urlStr:String, params:[String:Any], resultHandler: @escaping (Result<Data?, Error>) -> Void)  {
        
        guard let urlObject = URL(string:urlStr) else {
            let errorTemp = CustomError(title: "url error", description: "", code: 500)
            
            print("issue in url object")
            resultHandler(.failure(errorTemp))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: urlObject)) { dataObject, responseObj, errorObject in
            
            if let error = errorObject {
                resultHandler(.failure(error))
            } else {
                resultHandler(.success(dataObject))
            }
            //  onComplete((dataObject: dataObject, errorObject: errorObject))
        }.resume()
    }
}

protocol MovieErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}

struct CustomError: MovieErrorProtocol {
    
    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    
    private var _description: String
    
    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}

