//
//  UIStackViewTests.swift
//  LayoutItKit-iOSTests
//
//  Created by Abraao on 03/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

@testable import LayoutItKit
import XCTest

class UIStackViewTests: XCTestCase {
    
    static var allTests = [
        ("testInit", testInit),
        ("testWithPadding_withEdges_all", testWithPadding_withEdges_all),
        ("testWithPadding_withEdges_bottom", testWithPadding_withEdges_bottom),
        ("testWithPadding_withEdges_left", testWithPadding_withEdges_left),
        ("testWithPadding_withEdges_top", testWithPadding_withEdges_top),
        ("testWithPadding_withEdges_right", testWithPadding_withEdges_right),
        ("testWithPadding_withLength", testWithPadding_withLength),
    ]
    
    func testInit() {
        // Given
        let axis = NSLayoutConstraint.Axis.horizontal
        let views = [UILabel(), UIView()]
        let spacing = CGFloat(12)
        let alignment = UIStackView.Alignment.center
        let distribution = UIStackView.Distribution.fillEqually
        
        // When
        let stack = UIStackView(axis,
                                views: views,
                                spacing: spacing,
                                alignment: alignment,
                                distribution: distribution)
        // Then
        XCTAssertEqual(axis, stack.axis)
        XCTAssertEqual(views, stack.subviews)
        XCTAssertEqual(spacing, stack.spacing)
        XCTAssertEqual(alignment, stack.alignment)
        XCTAssertEqual(distribution, stack.distribution)
    }
    
    func testWithPadding_withEdges_all() {
        // Given
        let edge = LayoutItKit.StackLayout.Edge.all
        let length = CGFloat(1)
        
        // When
        let stack = UIStackView().withPadding(edge, length)
        
        // Then
        XCTAssertEqual(length, stack.layoutMargins.bottom)
        XCTAssertEqual(length, stack.layoutMargins.left)
        XCTAssertEqual(length, stack.layoutMargins.top)
        XCTAssertEqual(length, stack.layoutMargins.right)
    }
    
    func testWithPadding_withEdges_bottom() {
        // Given
        let edge = LayoutItKit.StackLayout.Edge.bottom
        let length = CGFloat(2)
        
        // When
        let stack = UIStackView().withPadding(edge, length)
        
        // Then
        XCTAssertEqual(length, stack.layoutMargins.bottom)
        XCTAssertEqual(0, stack.layoutMargins.left)
        XCTAssertEqual(0, stack.layoutMargins.top)
        XCTAssertEqual(0, stack.layoutMargins.right)
    }
    
    func testWithPadding_withEdges_left() {
        // Given
        let edge = LayoutItKit.StackLayout.Edge.left
        let length = CGFloat(3)
        
        // When
        let stack = UIStackView().withPadding(edge, length)
        
        // Then
        XCTAssertEqual(0, stack.layoutMargins.bottom)
        XCTAssertEqual(length, stack.layoutMargins.left)
        XCTAssertEqual(0, stack.layoutMargins.top)
        XCTAssertEqual(0, stack.layoutMargins.right)
    }
    
    func testWithPadding_withEdges_top() {
        // Given
        let edge = LayoutItKit.StackLayout.Edge.top
        let length = CGFloat(3)
        
        // When
        let stack = UIStackView().withPadding(edge, length)
        
        // Then
        XCTAssertEqual(0, stack.layoutMargins.bottom)
        XCTAssertEqual(0, stack.layoutMargins.left)
        XCTAssertEqual(length, stack.layoutMargins.top)
        XCTAssertEqual(0, stack.layoutMargins.right)
    }
    
    func testWithPadding_withEdges_right() {
        // Given
        let edge = LayoutItKit.StackLayout.Edge.right
        let length = CGFloat(3)
        
        // When
        let stack = UIStackView().withPadding(edge, length)
        
        // Then
        XCTAssertEqual(0, stack.layoutMargins.bottom)
        XCTAssertEqual(0, stack.layoutMargins.left)
        XCTAssertEqual(0, stack.layoutMargins.top)
        XCTAssertEqual(length, stack.layoutMargins.right)
    }
    
    func testWithPadding_withLength() {
        // Given
        let length = CGFloat(1)
        
        // When
        let stack = UIStackView().withPadding(length)
        
        // Then
        XCTAssertEqual(length, stack.layoutMargins.bottom)
        XCTAssertEqual(length, stack.layoutMargins.left)
        XCTAssertEqual(length, stack.layoutMargins.top)
        XCTAssertEqual(length, stack.layoutMargins.right)
    }
    
}
