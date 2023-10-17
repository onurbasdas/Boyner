//
//  DetailViewModel.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import Foundation

class DetailViewModel {
    
    var articles: [DetailArticles] = []
    var slideArticles: [DetailArticles] = []
    let service = Service()
    
    func getHeadlineData(sourceHeadlineId: String, completion: @escaping () -> Void) {
        service.getDetailHeadline(sourceID: sourceHeadlineId) { [self] article in
            guard var sourceItems = article else {
                completion()
                return
            }
            let readedList = Utils.shared.getReadList()
            for i in 0..<sourceItems.count {
                sourceItems[i].isSelected = readedList.contains(sourceItems[i].title ?? "")
            }
            self.articles = sourceItems
            self.slideArticles = Array(self.articles.prefix(3))
            self.articles.removeSubrange(0..<3)
            completion()
        }
    }
}
