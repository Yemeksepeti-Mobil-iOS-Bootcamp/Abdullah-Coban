//
//  UIView+Extension.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import UIKit

public extension UIView {
    
    func nibInstantiate(autoResizingMask: UIView.AutoresizingMask = []) -> UIView {
        let bundle = Bundle(for: Self.self)
        let nib = bundle.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        let view = nib?.first as! UIView
        view.autoresizingMask = autoResizingMask
        return view
    }
}
