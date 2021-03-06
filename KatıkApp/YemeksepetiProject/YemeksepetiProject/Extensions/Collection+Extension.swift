//
//  Collection+Extension.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import Foundation

public extension Collection where Indices.Iterator.Element == Index {
    
    subscript(safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
