//
//  OrderDetails.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 19.08.2021.
//

import Foundation

struct OrderDetails: Decodable {
    let id, orderID: Int
    let productName: String
    let count, price: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case orderID = "OrderId"
        case productName = "ProductName"
        case count = "Count"
        case price = "Price"
    }
}
