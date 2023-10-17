//
//  HomeViewModel.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import Foundation

class HomeViewModel {
    
    var sources: [Source] = []
    let service = Service()
    
    func getData(completion: @escaping () -> Void) {
        service.getSources { [self] source in
            guard let sourceItems = source else {
                completion()
                return
            }
            self.sources = sourceItems.filter { $0.language == "en" }
            completion()
        }
    }
    
    func getSegmentInfo() -> (numberOfSegments: Int, segmentTitles: [String]) {
        let numberOfSegments = Set(sources.map { $0.category }).count
        let segmentTitles = Array(Set(sources.map { $0.category }))
        return (numberOfSegments, segmentTitles)
    }
}
