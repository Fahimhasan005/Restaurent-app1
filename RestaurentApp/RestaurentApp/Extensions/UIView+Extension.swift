//
//  UIView+Extension.swift
//  RestaurentApp
//
//  Created by Fahim Hasan on 2023/09/29.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadious: CGFloat {
        get { return self.cornerRadious }
        set {
            self.layer.cornerRadius = newValue
            
        }
    }
}
