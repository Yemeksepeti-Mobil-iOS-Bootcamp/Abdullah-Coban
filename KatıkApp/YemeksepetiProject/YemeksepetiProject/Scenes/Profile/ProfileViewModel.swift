//
//  ProfileViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import Foundation
import Firebase

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate? { get set }
    var profile: ProfileModel { get }
}

protocol ProfileViewModelDelegate: AnyObject {
    
}

final class ProfileViewModel {
    
    weak var delegate: ProfileViewModelDelegate?
    
    var userId = Auth.auth().currentUser?.uid
    
    private func getUserInfo(userId: String) -> ProfileModel? {
        
        let urlStr = "https://yemeksepetibackend20210801094642.azurewebsites.net/api/User/GetUserWithId?userId=\(userId)"

        guard let url = URL(string: urlStr) else {
            fatalError("Invalid URL")
        }
        
        let profile = try? JSONDecoder().decode(ProfileModel.self, from: Data(contentsOf: url))
        
        guard let profile = profile else { fatalError("No Data") }
                
        return profile
    }
}

extension ProfileViewModel: ProfileViewModelProtocol {
    
    var profile: ProfileModel {
        getUserInfo(userId: userId!)!
    }
    
    
}
