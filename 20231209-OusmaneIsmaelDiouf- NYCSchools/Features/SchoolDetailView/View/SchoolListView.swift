//
//  SchoolListView.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchools
//
//  Created by ousmane diouf on 9/12/23.
//

import SwiftUI

struct SchoolListView: View {
    @StateObject private var viewModel = SchoolListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.schools, id: \.dbn) { item in
                            NavigationLink(destination: SchoolDetailView(schoolName: item.schoolName,
                                                                         schoolId: item.dbn)
                            ) {
                                Text(item.schoolName)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("School List")
                    .foregroundColor(Color.brown)
                }
            }
            .background(Image("logo"))
            .onAppear {
                viewModel.getSchoolnNames()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView()
    }
}


