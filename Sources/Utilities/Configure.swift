//
//  Configure.swift
//  LayoutItKit-iOS
//
//  Created by Abraao Levi on 06/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import Foundation

@discardableResult
public func configure<T>(_ value: T, using closure: (inout T) throws -> Void) rethrows -> T {
    var value = value
    try closure(&value)
    return value
}
