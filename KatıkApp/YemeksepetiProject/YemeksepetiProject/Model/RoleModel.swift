//
//  RoleModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 4.08.2021.
//

import Foundation

struct Role: Decodable {
    let id: Int
    let role: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case role = "Role"
    }
}
