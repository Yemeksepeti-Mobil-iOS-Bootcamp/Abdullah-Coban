//
//  Orders.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 19.08.2021.
//

import Foundation

struct Order: Decodable {
    let id: Int
    let name, surname, address, phone: String
    let orderDate: String
    let price: Int
    let status: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case surname = "Surname"
        case address = "Address"
        case phone = "Phone"
        case orderDate = "OrderDate"
        case price = "Price"
        case status = "Status"
    }
}
