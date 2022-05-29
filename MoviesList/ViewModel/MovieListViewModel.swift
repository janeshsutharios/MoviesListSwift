//
//  MovieListViewModel.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import UIKit
class MovieListViewModel {
    
    internal let moviesListModel: MovieObserver<MovieListModel?> = MovieObserver(nil)  //no data  initially
    private let apiService: APIServiceProtocol
    internal var isToShowLoader: MovieObserver<Bool> = MovieObserver(false)  //no data  initially

    init(apiService: APIServiceProtocol = NetworkHelper()) {
        self.apiService = apiService
    }
    
    internal func fetchMovieList(params:[String:Any], complete: @escaping (MovieObserver<MovieListModel?>)->() ) {
        isToShowLoader.value = true
        
        self.apiService.startNetworkTask(urlStr: NetworkHelperConstants.movieListURL, params: [:]) { result in
            self.isToShowLoader.value = false
            switch result {
                
            case .success(let dataObject):
                do {
                    let decoderObject = JSONDecoder()
                    self.moviesListModel.value = try decoderObject.decode(MovieListModel.self, from: dataObject!)
                }
                catch {
                    //print("error--->", errorObject)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            complete(self.moviesListModel)
        }
        
    }
}
