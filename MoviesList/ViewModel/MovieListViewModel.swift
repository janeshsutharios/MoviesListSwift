//
//  MovieListViewModel.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import UIKit
class MovieListViewModel {
    
    let moviesListModel: MovieObserver<MovieListModel?> = MovieObserver(nil)  //no data  initially
    
    func fetchMovieList(params:[String:Any], complete: @escaping (MovieObserver<MovieListModel?>)->() ) {
        
#if UNITTEST
        let jsonData = SwiftUtility.loadJson(filename: "MovieList")
        let decoderObject = JSONDecoder()
        do {
            self.moviesListModel.value = try decoderObject.decode(MovieListModel.self, from: jsonData)
            complete(self.moviesListModel)
        } catch {}
#else
        NetworkHelper.shared.startNetworkTask(urlStr: NetworkHelperConstants.movieListURL, params: [:]) { result in
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
#endif
        
        
    }
}
