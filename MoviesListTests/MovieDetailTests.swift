//
//  MovieDetailTests.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import XCTest
@testable import MoviesList

class MovieDetailTests: XCTestCase {
    
    var sut: MovieDetailViewModel?
    
    override func setUp() {
        super.setUp()
        sut = MovieDetailViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_popular_photos() {
        
        // Given A API Model
        let sut = self.sut!
        
        // When fetch Movies Data
        let expect = XCTestExpectation(description: "movieDetailCallBack")
        
        sut.fetchMovieDetails(movieId: "1223") { dataObject in
            expect.fulfill()
            XCTAssertNotEqual( dataObject.value?.overview, "")
            
        }
        
        wait(for: [expect], timeout: 1)
    }
    
}
