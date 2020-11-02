//
//  UILabel.swift
//  LayoutItKit-iOS
//
//  Created by Abraao on 01/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import UIKit

extension UILabel {
    convenience public init(text: String? = nil,
                            font: UIFont? = UIFont.systemFont(ofSize: 14),
                            textColor: UIColor = .black,
                            textAlignment: NSTextAlignment = .left,
                            numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    open func withText(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    open func withFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    open func withTextColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    open func withTextAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    
    open func withNumberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
}
