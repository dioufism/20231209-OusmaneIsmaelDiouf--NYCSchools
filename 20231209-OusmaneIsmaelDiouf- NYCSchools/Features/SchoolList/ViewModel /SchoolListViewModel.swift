//
//  SchoolListViewModel.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchools
//
//  Created by ousmane diouf on 9/12/23.
//

import Foundation

enum Constants {
    static let schoolEndpoint = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    static func schoolDetailEndpoint(forID id: String) -> String {
        return "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(id)"
    }
}

protocol SchoolListViewModelConfigurator: ObservableObject {
    func getSchoolnNames()

}

final class SchoolListViewModel: SchoolListViewModelConfigurator {
    @Published private(set) var schools: [SchoolNames] = []
    @Published private(set) var hasError: Bool = false
    @Published private(set) var isLoading  =  false
    
    func getSchoolnNames() {
        self.isLoading =  true
        self.hasError = false
        
        NetworkingManager.shared.request(Constants.schoolEndpoint,
                                         type: [SchoolNames].self) { [weak self] res in
            DispatchQueue.main.async {
                defer { self?.isLoading = false }
                switch res {
                case .success(let response):
                    self?.schools = response
                case .failure(let error):
                    self?.hasError = true
                    print(error)
                }
            }
        }
    }
}
