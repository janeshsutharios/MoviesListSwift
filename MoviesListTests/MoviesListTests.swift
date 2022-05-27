//
//  MoviesListTests.swift
//  MoviesListTests
//
//  Created by Janesh Suthar on 27/05/22.
//


import XCTest
@testable import MoviesList

class MoviesListTests: XCTestCase {
    
    var sut: MovieListViewModel?
    
    override func setUp() {
        super.setUp()
        sut = MovieListViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_popular_photos() {
        
        // Given A API Model
        let sut = self.sut!
        
        // When fetch Movies Data
        let expect = XCTestExpectation(description: "callback")
        
        sut.fetchMovieList(params: [:]) { dataObject in
            expect.fulfill()
            XCTAssertNotEqual( dataObject.value?.results?.count, 0)
            for movieObject in dataObject.value?.results ?? [] {
                XCTAssertNotNil(movieObject.id)
            }
        }
        
        wait(for: [expect], timeout: 1)
    }
    
}
