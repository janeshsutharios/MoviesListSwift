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
    var mockAPIServiceMovieList: MockAPIServiceMovieList!

    override func setUp() {
        super.setUp()
        sut = MovieListViewModel()
        
        mockAPIServiceMovieList = MockAPIServiceMovieList()
        sut = MovieListViewModel(apiService: mockAPIServiceMovieList)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchMovies() {

        // Given A API Model
        let sut = self.sut!
        
        let expect = XCTestExpectation(description: "callback")
        // When
        sut.fetchMovieList(params: [:]) { dataObject in
            expect.fulfill()
            // Then
            XCTAssertNotEqual( dataObject.value?.results?.count, 0)
            for movieObject in dataObject.value?.results ?? [] {
                XCTAssertNotNil(movieObject.id)
            }
        }
        
        wait(for: [expect], timeout: 1)
    }
    
}
