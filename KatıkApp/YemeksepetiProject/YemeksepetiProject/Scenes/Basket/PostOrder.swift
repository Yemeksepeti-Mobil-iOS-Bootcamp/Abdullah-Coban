//
//  PostOrder.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 19.08.2021.
//

import Foundation

struct PostOrder: Codable {
    
    var orderNote: String
    var productList: [productList]
    var userId: String
}

struct productList: Codable {
    var productId: Int
    var productCount: Int
}
