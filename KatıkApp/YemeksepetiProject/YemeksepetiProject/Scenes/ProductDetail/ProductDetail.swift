//
//  ProductDetail.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 16.08.2021.
//

import Foundation


struct ProductDetail: Decodable {
    
    let id: Int
    let userId: Int
    let price: Int
    let count: Int
    let productName: String
    
}
