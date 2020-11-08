//
//  UIView.swift
//  LayoutItKit-iOS
//
//  Created by Abraao on 01/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import UIKit

extension UIView {
    
    convenience public init(backgroundColor: UIColor = .clear) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    @discardableResult
    open func withSize(_ size: CGSize) -> Self {
        return withSize(width: size.width, height: size.height)
    }
    
    @discardableResult
    open func withSize(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        return self
    }
    
    @discardableResult
    open func withBorder(width: CGFloat = 4, color: UIColor = .black) -> Self {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }

    @discardableResult
    open func withShadow(opacity: Float = 0,
                         radius: CGFloat = 0,
                         offset: CGSize = .zero,
                         color: UIColor = .black) -> Self {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        return self
    }
}
