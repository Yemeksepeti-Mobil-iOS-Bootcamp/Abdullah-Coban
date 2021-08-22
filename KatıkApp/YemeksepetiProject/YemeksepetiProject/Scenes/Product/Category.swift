//
//  Category.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import Foundation

struct Category: Decodable {
    let id: Int
    let category: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case category = "Category"
    }
}
