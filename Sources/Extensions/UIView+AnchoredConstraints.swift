//
//  UIView+AnchoredConstraints.swift
//  LayoutItKit-iOS
//
//  Created by Abraao on 01/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    open func anchor(_ anchors: LayoutItKit.AutoLayout.Anchor...) -> LayoutItKit.AutoLayout.AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = LayoutItKit.AutoLayout.AnchoredConstraints()
        
        anchors.forEach { anchor in
            switch anchor {
            case .top(let anchor, let constant):
                anchoredConstraints.top = topAnchor.constraint(equalTo: anchor, constant: constant)
                
            case .leading(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(equalTo: anchor, constant: constant)
                
            case .bottom(let anchor, let constant):
                anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
                
            case .trailing(let anchor, let constant):
                anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
                
            case .height(let constant):
                if constant > 0 {
                    anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
                }
                
            case .width(let constant):
                if constant > 0 {
                    anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
                }
                
            }
        }
        
        anchoredConstraints.activeConstraints()
        
        return anchoredConstraints
    }
    
    @discardableResult
    open func anchor(top: NSLayoutYAxisAnchor?,
                     leading: NSLayoutXAxisAnchor?,
                     bottom: NSLayoutYAxisAnchor?,
                     trailing: NSLayoutXAxisAnchor?,
                     padding: UIEdgeInsets = .zero,
                     size: CGSize = .zero) -> LayoutItKit.AutoLayout.AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = LayoutItKit.AutoLayout.AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        anchoredConstraints.activeConstraints()
        
        return anchoredConstraints
    }
    
    @discardableResult
    open func fillSuperview(padding: UIEdgeInsets = .zero) -> LayoutItKit.AutoLayout.AnchoredConstraints {
        guard let superviewTopAnchor = superview?.topAnchor,
              let superviewBottomAnchor = superview?.bottomAnchor,
              let superviewLeadingAnchor = superview?.leadingAnchor,
              let superviewTrailingAnchor = superview?.trailingAnchor else {
            return LayoutItKit.AutoLayout.AnchoredConstraints()
        }
        
        return anchor(top: superviewTopAnchor,
                      leading: superviewLeadingAnchor,
                      bottom: superviewBottomAnchor,
                      trailing: superviewTrailingAnchor,
                      padding: padding)
    }
    
    @discardableResult
    open func fillSuperviewSafeAreaLayoutGuide(
        padding: UIEdgeInsets = .zero) -> LayoutItKit.AutoLayout.AnchoredConstraints {
        guard let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor,
              let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor,
              let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor,
              let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor else {
            return LayoutItKit.AutoLayout.AnchoredConstraints()
        }
        
        return anchor(top: superviewTopAnchor,
                      leading: superviewLeadingAnchor,
                      bottom: superviewBottomAnchor,
                      trailing: superviewTrailingAnchor,
                      padding: padding)
    }
    
    @discardableResult
    open func constrainHeight(_ constant: CGFloat) -> LayoutItKit.AutoLayout.AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = LayoutItKit.AutoLayout.AnchoredConstraints()
        anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.activeConstraints()
        return anchoredConstraints
    }
    
    @discardableResult
    open func constrainWidth(_ constant: CGFloat) -> LayoutItKit.AutoLayout.AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = LayoutItKit.AutoLayout.AnchoredConstraints()
        anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.activeConstraints()
        return anchoredConstraints
    }
    
}
