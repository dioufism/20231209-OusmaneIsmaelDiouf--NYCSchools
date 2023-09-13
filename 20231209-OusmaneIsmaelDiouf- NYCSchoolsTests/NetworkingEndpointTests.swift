//
//  _0231209_OusmaneIsmaelDiouf__NYCSchoolsTests.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchoolsTests
//
//  Created by ousmane diouf on 9/12/23.
//

import XCTest
@testable import _0231209_OusmaneIsmaelDiouf__NYCSchools

final class NetworkingEndpointTest: XCTestCase {
    
    func test_with_school_list_endpoint_request_is_valid () {
        XCTAssertEqual(Constants.schoolEndpoint, "https://data.cityofnewyork.us/resource/s3k6-pzi2.json" )
    }
    
    func test_with_school_detail_endpoint_request_is_valid () {
        let id = "25Q285"
        let endpoint =  Constants.schoolDetailEndpoint(forID: id)
        
        XCTAssertEqual(endpoint, "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(id)")
    }
    

    


}
