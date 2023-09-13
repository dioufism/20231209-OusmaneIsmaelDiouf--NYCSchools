//
//   SchoolDetailView.swift
//  20231209-OusmaneIsmaelDiouf- NYCSchools
//
//  Created by ousmane diouf on 9/12/23.
//

import SwiftUI

struct SchoolDetailView: View {
    let schoolName: String
    let schoolId: String
    
    @StateObject private var viewModel = SchoolDetailViewModel()
    
    var body: some View {
        HStack {
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text(schoolName)
                    .foregroundColor(Color.brown)
                    .fontWeight(.black)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .font(.title)
                
                if let items = viewModel.schoolDetails, !items.isEmpty {
                    ForEach(items, id: \.dbn) { item in
                        
                        VStack {
                            ScoreDetailView(scoreTitle: "Average Math Score", score: item.mathScore ?? "")
                            
                            ScoreDetailView(scoreTitle: "Average Reading Score", score: item.readingScore ?? "")
                            
                            ScoreDetailView(scoreTitle: "Average Writing Score", score: item.writingScore ?? "")
                            
                        }
                    }
                }
                
            }
        }
        .background(Image("logo"))
        .onAppear {
            viewModel.getSchoolDetails(schoolId: self.schoolId)
        }
    }
}





struct ScoreDetailView: View {
    let scoreTitle: String
    let score: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Divider()
            
            HStack() {
                Text(scoreTitle)
                    .foregroundColor(Color.brown)
                    .font(.subheadline)
                
                Divider()
                    .background(Color.blue)
                    .frame(height: 20)
                
                Text(score)
                    .foregroundColor(Color.brown)
                    .font(.subheadline)
            }
            Divider()
        }
    }
}

struct _SchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetailView(schoolName: "name", schoolId: "dafda")
    }
}
