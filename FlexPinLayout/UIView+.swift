//
//  UIView+.swift
//  FlexPinLayout
//
//  Created by  EUNYEONG on 2022/02/02.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
