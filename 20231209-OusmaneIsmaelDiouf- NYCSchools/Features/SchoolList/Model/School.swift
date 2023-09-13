//
//  School.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchools
//
//  Created by ousmane diouf on 9/12/23.
//

import Foundation

struct SchoolNames: Codable {
    let schoolName: String
    let dbn: String

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
    }
}
