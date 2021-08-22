//
//  Register.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import Foundation

struct RegisterModel: Codable {
    let userID, username, password, name: String
    let surname, phone, address: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case username = "Username"
        case password = "Password"
        case name = "Name"
        case surname = "Surname"
        case phone = "Phone"
        case address = "Address"
    }
}
