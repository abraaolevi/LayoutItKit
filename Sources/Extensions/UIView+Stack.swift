//
//  UIView+Stack.swift
//  LayoutItKit-iOS
//
//  Created by Abraao on 01/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    open func stack(_ axis: NSLayoutConstraint.Axis = .vertical,
                    views: [UIView],
                    spacing: CGFloat = 0,
                    alignment: UIStackView.Alignment = .fill,
                    distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView(axis,
                                    views: views,
                                    spacing: spacing,
                                    alignment: alignment,
                                    distribution: distribution)
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }
    
    @discardableResult
    open func scrollableStack(_ axis: NSLayoutConstraint.Axis = .vertical,
                              views: [UIView],
                              spacing: CGFloat = 0,
                              alignment: UIStackView.Alignment = .fill,
                              distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let scrollView = UIScrollView()
        addSubview(scrollView)
        scrollView.fillSuperview()
        
        let stackView = scrollView.stack(axis,
                                         views: views,
                                         spacing: spacing,
                                         alignment: alignment,
                                         distribution: distribution)

        scrollView.translatesAutoresizingMaskIntoConstraints = false        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
        return stackView
    }

}
