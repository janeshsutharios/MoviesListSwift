//
//  MovieListModel.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import Foundation


struct MovieListModel: Codable {
    var averageRating: Double?
    var backdropPath: String?
    var comments: [String: String?]?
    var createdBy: CreatedBy?
    var dddDescription: String?
    var id: Int?
    var iso3166_1: String?
    var iso639_1: String?
    var name: String?
    var objectIDS: [String: String?]?
    var page: Int?
    var posterPath: String?
    var dddPublic: Bool?
    var results: [ResultDataSet]?
    var revenue, runtime: Int?
    var sortBy: String?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case averageRating = "average_rating"
        case backdropPath = "backdrop_path"
        case comments
        case createdBy = "created_by"
        case dddDescription = "description"
        case id
        case iso3166_1 = "iso_3166_1"
        case iso639_1 = "iso_639_1"
        case name
        case objectIDS = "object_ids"
        case page
        case posterPath = "poster_path"
        case dddPublic = "public"
        case results, revenue, runtime
        case sortBy = "sort_by"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    var gravatarHash, id, name, username: String?

    enum CodingKeys: String, CodingKey {
        case gravatarHash = "gravatar_hash"
        case id, name, username
    }
}



// MARK: - Result
struct ResultDataSet: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var mediaType: String?
    var originalLanguage: String?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
