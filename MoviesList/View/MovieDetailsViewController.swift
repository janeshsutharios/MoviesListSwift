//
//  MovieDetailsViewController.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieDescription: UITextView!
    var movieDetailModel = MovieDetailViewModel()
    var movieId:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callAPI()
    }
    
    
    func callAPI() {
        movieImageView.image = nil
        self.view.activityStartAnimating(activityColor: UIColor.red, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        movieDetailModel.fetchMovieDetails(movieId: movieId) { entity in
            
        }
        movieDetailModel.moviesDetailModel.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.view.activityStopAnimating()
                self?.setUpData()
            }
        }
    }
    
    func setUpData() {
        guard let validObject = movieDetailModel.moviesDetailModel.value else {
            return
        }
        movieImageView.kf.indicatorType = .activity
        movieTitle.text = (validObject.originalTitle ?? "") + "\n" + "Released on:- " + (validObject.releaseDate ?? "--")
        movieDescription.text = validObject.overview
        if let validURL = validObject.posterPath {
            let fullURL = URL(string: NetworkHelperConstants.imgBaseURL + validURL)
            movieImageView.kf.setImage(with: fullURL)
        }
        
    }
    
}

