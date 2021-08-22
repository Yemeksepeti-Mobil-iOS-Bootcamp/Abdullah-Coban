//
//  Basket.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 14.08.2021.
//

import Foundation

struct Basket: Decodable {
    let id: Int
    let userId: Int
    let count: Int
    let price: Int
    let productName: String
}
