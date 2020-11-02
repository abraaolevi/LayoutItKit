//
//  LayoutItKit.swift
//  LayoutItKit
//
//  Created by Abraão Levi on 1 Nov 2020.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

// Include Foundation
@_exported import Foundation

import UIKit

public enum LayoutItKit { }

extension LayoutItKit {
    public enum AutoLayout { }
    public enum StackLayout { }
}

extension LayoutItKit.StackLayout {

    public enum Edge {
        case all
        case bottom
        case left
        case top
        case right
    }
}

extension LayoutItKit.AutoLayout {

    public enum Anchor {
        case top(_ top: NSLayoutYAxisAnchor, constant: CGFloat = 0)
        case leading(_ leading: NSLayoutXAxisAnchor, constant: CGFloat = 0)
        case bottom(_ bottom: NSLayoutYAxisAnchor, constant: CGFloat = 0)
        case trailing(_ trailing: NSLayoutXAxisAnchor, constant: CGFloat = 0)
        case height(_ constant: CGFloat)
        case width(_ constant: CGFloat)
    }
    
    public struct AnchoredConstraints {
        public var top: NSLayoutConstraint?
        public var leading: NSLayoutConstraint?
        public var bottom: NSLayoutConstraint?
        public var trailing: NSLayoutConstraint?
        public var width: NSLayoutConstraint?
        public var height: NSLayoutConstraint?
        
        func activeConstraints() {
            [top, leading, bottom, trailing, width, height].forEach { $0?.isActive = true }
        }
    }
}
