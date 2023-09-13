//
//  SchoolDetailViewModel.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchools
//
//  Created by ousmane diouf on 9/12/23.
//

import Foundation

protocol SchoolDetailViewModelConfigurator: ObservableObject {
    func getSchoolDetails(schoolId: String)

}

final class SchoolDetailViewModel: SchoolDetailViewModelConfigurator {
    @Published private(set) var schoolDetails: [SchoolDetails]?
    @Published private var hasError = false
    @Published private var error: Error?
    @Published private(set) var isLoading  =  false
    
    func getSchoolDetails(schoolId: String) {
        self.isLoading =  true
        self.hasError = false
        
        NetworkingManager.shared.request(Constants.schoolDetailEndpoint(forID: schoolId) ,
                                         type: [SchoolDetails].self) { [weak self] res in
            DispatchQueue.main.async {
                defer { self?.isLoading = false }
                switch res {
                case .success(let response):
                    self?.schoolDetails = response
                    self?.isLoading =  false

                case .failure(let error):
                    self?.hasError = true
                    self?.error =  error
                }
            }
        }
    }
}
