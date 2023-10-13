//
//  Service.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import Foundation
import Alamofire


class Service {
    func getSources(callback: @escaping ([Source]?) -> Void) {
        AF.request(Constants.apiURL+Constants.apiKEY, method: .get).responseDecodable(of: SourceResponseModel.self) { response in
            guard let data = response.data else{ return }
            do {
                let eventResponse = try JSONDecoder().decode(SourceResponseModel.self, from:data)
                callback(eventResponse.sources)
                
            } catch let e {
                print(e)
            }
        }
    }
}
