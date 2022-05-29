//
//  MovieDetailViewModel.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//
import UIKit

class MovieDetailViewModel {
    
    internal let moviesDetailModel: MovieObserver<MovieDetailModel?> = MovieObserver(nil)  //no data  initially
    private let apiService: APIServiceProtocol
    internal var isToShowLoader: MovieObserver<Bool> = MovieObserver(false)  //no data  initially

    init(apiService: APIServiceProtocol = NetworkHelper()) {
        self.apiService = apiService
    }
    
    internal func fetchMovieDetails(movieId:String, complete: @escaping (MovieObserver<MovieDetailModel?>)->() ) {
        isToShowLoader.value = true

        let finalURL = NetworkHelperConstants.movieDetailURL + movieId + "?api_key=\(NetworkHelperConstants.apiKey)"
        
        apiService.startNetworkTask(urlStr:finalURL, params: [:]) {  result in
            self.isToShowLoader.value = false

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
            complete(self.moviesDetailModel)
            
        }
    }


}


