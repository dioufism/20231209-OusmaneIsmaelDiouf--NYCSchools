//
//  SchoolDetails.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchools
//
//  Created by ousmane diouf on 9/12/23.
//

import Foundation

struct SchoolDetails: Codable, Equatable {
    let dbn, readingScore: String?
    let mathScore, writingScore: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
}

