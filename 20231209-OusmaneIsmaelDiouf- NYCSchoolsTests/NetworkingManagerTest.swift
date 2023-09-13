//
//  NetworkingManagerTest.swift.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchoolsTests
//
//  Created by ousmane diouf on 9/13/23.
//

import XCTest

final class NetworkingManagerTest: XCTestCase {
    private var session: URLSession!
    private var url: URL!

//    override func setup() throws {
//        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
//        // init configuration
//        // setup MockURLSession
//        // init session
//    }
//
//    override func teardown() throws {
//        session = nil
//        url = nil
//    }
    
    func test_with_successsful_response_with_valid_response() {
        // copy mock json from the system
        // mock the response with a valid status code
        // return the data and the respone
        // calll the request function from the networking manager with params
        // create static json response
        //Assert that the static json response is equal to our api call response
    }
    
    func test_with_successsful_response_with_invalid_response() {
        // same process as above but the response is invalid and will test the failure case by asserting there was an error
    }
}
