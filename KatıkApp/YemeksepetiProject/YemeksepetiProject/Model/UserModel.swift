//
//  UserModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 4.08.2021.
//

import Foundation

struct User: Decodable {
    let id: Int
    let username, password: String
    let role: Role

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case username = "Username"
        case password = "Password"
        case role = "Role"
    }
}


struct InsertUser: Codable {
    let Username, Password: String
    let RoleID: Int
}
