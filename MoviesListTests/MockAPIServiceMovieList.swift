//
//  MockAPIServiceMovieList.swift
//  MoviesListTests
//
//  Created by Janesh Suthar on 29/05/22.
//

import XCTest


@testable import MoviesList

class MockAPIServiceMovieList:  APIServiceProtocol {
    
    let moviesListModel: MovieObserver<MovieListModel?> = MovieObserver(nil)  //no data  initially
    
    func startNetworkTask(urlStr:String, params:[String:Any], resultHandler: @escaping (Result<Data?, Error>) -> Void)  {
        
        let jsonData = SwiftUtility.loadJson(filename: "MovieList")
        let decoderObject = JSONDecoder()
        do {
            self.moviesListModel.value = try decoderObject.decode(MovieListModel.self, from: jsonData)
            resultHandler(.success(jsonData))
        } catch {}
    }
  
}


//class MockAPIServiceMovieList: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
