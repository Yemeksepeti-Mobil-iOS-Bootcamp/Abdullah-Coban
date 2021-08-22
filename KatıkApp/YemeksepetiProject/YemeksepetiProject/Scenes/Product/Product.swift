//
//  Product.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import Foundation

struct Product: Decodable {
    
    let id: Int
    let productName: String
    let price: Int
    let image: String
    let category: Category
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case productName = "ProductName"
        case price = "Price"
        case image = "Image"
        case category = "Category"
    }
    
}
