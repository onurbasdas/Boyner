//
//  SourceResponseModel.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import Foundation

struct SourceResponseModel: Decodable {
    let status: String
    let sources: [Source]
}

struct Source: Decodable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String
    let language: String
    let country: String
}
