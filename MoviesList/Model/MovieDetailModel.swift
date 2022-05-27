//
//  MovieDetailModel.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import Foundation

// MARK: - MovieDetailModel
struct MovieDetailModel: Codable {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: BelongsToCollection?
    var budget: Int?
    var Strings: [String]?
    var homepage: String?
    var id: Int?
    var imdbID, originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompany]?
    //var productionCountries: [String]?
    var releaseDate: String?
    var revenue, runtime: Int?
    var status, tagline, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, Strings, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
      //  case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    var id: Int?
    var name, posterPath, backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}


// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    var id: Int?
    var logoPath, name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

