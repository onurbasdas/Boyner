//
//  DetailViewModel.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import Foundation

class DetailViewModel {
    var articles: [DetailArticles] = []
    let service = Service()
    
    
    func getHeadlineData(sourceHeadlineId: String, completion: @escaping () -> Void) {
        service.getDetailHeadline(sourceID: sourceHeadlineId) { [self] article in
            guard let sourceItems = article else {
                completion()
                return
            }
            self.articles = sourceItems
            completion()
        }
    }
}
