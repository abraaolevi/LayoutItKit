//
//  UIStackView.swift
//  LayoutItKit-iOS
//
//  Created by Abraao on 01/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import UIKit

extension UIStackView {

    convenience public init(_ axis: NSLayoutConstraint.Axis = .vertical,
                            views: [UIView],
                            spacing: CGFloat = 0,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }

    @discardableResult
    open func withPadding(_ edges: LayoutItKit.StackLayout.Edge = .all, _ length: CGFloat = 16) -> Self {
        isLayoutMarginsRelativeArrangement = true
        switch edges {
        case .all:
            layoutMargins = UIEdgeInsets(top: length, left: length, bottom: length, right: length)
        case .bottom:
            layoutMargins.bottom = length
        case .left:
            layoutMargins.left = length
        case .top:
            layoutMargins.top = length
        case .right:
            layoutMargins.right = length
        }
        return self
    }
    
    @discardableResult
    open func withPadding(_ length: CGFloat) -> Self {
        withPadding(.all, length)
    }
}
