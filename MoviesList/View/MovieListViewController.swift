//
//  ViewController.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import UIKit
import Kingfisher

class MovieListViewController: UIViewController {
    
    @IBOutlet var moviesTableView: UITableView!
    var movieViewModel = MovieListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callAPI()
    }
    
    func setupUI() {
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.estimatedRowHeight = 100
        
    }
    
    func callAPI() {
        self.view.activityStartAnimating(activityColor: UIColor.red, backgroundColor: UIColor.black.withAlphaComponent(0.5))

        movieViewModel.fetchMovieList(params: [:]) { onComplete in
            
        }
        movieViewModel.moviesListModel.bind { [weak self] newsModel in
            DispatchQueue.main.async {
                self?.view.activityStopAnimating()
                self?.moviesTableView.reloadData()
            }
        }
    }
    
}


extension MovieListViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        if movieViewModel.moviesListModel.value == nil {
            return 0
        }
        return movieViewModel.moviesListModel.value?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        guard let dataObject = movieViewModel.moviesListModel.value?.results?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.movieTitle.text = dataObject.originalTitle
        if let validURL = dataObject.posterPath {
            let fullURL = URL(string: NetworkHelperConstants.imgBaseURL + validURL)
            cell.movieImgView.kf.setImage(with: fullURL)
        }
        cell.movieImgView.kf.indicatorType = .activity

        return cell
    }
    
    
}

extension MovieListViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let dataObject = movieViewModel.moviesListModel.value?.results?[indexPath.row] else {
            return
        }
        
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            vc.movieId = String(dataObject.id ?? 0)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
