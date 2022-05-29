//
//  MockAPIServiceMovieDetail.swift
//  MoviesListTests
//
//  Created by Janesh Suthar on 29/05/22.
//

import Foundation
@testable import MoviesList

class MockAPIServiceMovieDetail:  APIServiceProtocol {
    
    let movieDetailModel: MovieObserver<MovieDetailModel?> = MovieObserver(nil)  //no data  initially
    
    func startNetworkTask(urlStr:String, params:[String:Any], resultHandler: @escaping (Result<Data?, Error>) -> Void)  {
        
        let jsonData = SwiftUtility.loadJson(filename: "MovieDetail")
        let decoderObject = JSONDecoder()
        do {
            self.movieDetailModel.value = try decoderObject.decode(MovieDetailModel.self, from: jsonData)
            resultHandler(.success(jsonData))
        } catch {}
    }
  
}
