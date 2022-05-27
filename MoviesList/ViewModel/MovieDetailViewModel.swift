//
//  MovieDetailViewModel.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//
import UIKit

class MovieDetailViewModel {
    
    let moviesDetailModel: MovieObserver<MovieDetailModel?> = MovieObserver(nil)  //no data  initially
    
    func fetchMovieDetails(movieId:String, complete: @escaping (MovieObserver<MovieDetailModel?>)->() ) {
        
#if UNITTEST
        let jsonData = SwiftUtility.loadJson(filename: "MovieDetail")
        let decoderObject = JSONDecoder()
        do {
            self.moviesDetailModel.value = try decoderObject.decode(MovieDetailModel.self, from: jsonData)
            complete(self.moviesDetailModel)
        } catch {}
#else
        
        let finalURL = NetworkHelperConstants.movieDetailURL + movieId + "?api_key=\(NetworkHelperConstants.apiKey)"
        
        NetworkHelper.shared.startNetworkTask(urlStr:finalURL, params: [:]) {  result in
            
            switch result {
            case .success(let dataObject):
                do {
                    let decoderObject = JSONDecoder()
                    self.moviesDetailModel.value = try decoderObject.decode(MovieDetailModel.self, from: dataObject!)
                }
                catch {
                    //print("error--->", errorObject)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
#endif
    }


}


