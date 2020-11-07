//
//  UIViewTests.swift
//  LayoutItKit-iOSTests
//
//  Created by Abraao Levi on 06/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

@testable import LayoutItKit
import XCTest

class UIViewTests: XCTestCase {

    func testInit() throws {
        let color: UIColor = .black
        let view2 = UIView(backgroundColor: color)
        XCTAssertEqual(view2.backgroundColor, color)
    }
    
    func testWithSizeMethod_withNoParameters() throws {
        let view = UIView().withSize()
        XCTAssertEqual(view.constraints.count, 0)
    }
    
    func testWithSizeMethod_withCGSizeParameter() throws {
        let width: CGFloat = 123
        let height: CGFloat = 456
        let view = UIView().withSize(CGSize(width: width, height: height))
        
        let widthConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .width }).first)
        let heightConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .height }).first)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(widthConstraint.constant, width)
        XCTAssertEqual(heightConstraint.constant, height)
    }

    func testWithSizeMethod_onlyWidthParameter() throws {
        let width: CGFloat = 123
        let view = UIView().withSize(width: width)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(view.constraints.count, 1)
        XCTAssertEqual(view.constraints[0].constant, width)
    }
    
    func testWithSizeMethod_onlyHeightParameter() throws {
        let height: CGFloat = 123
        let view = UIView().withSize(height: height)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(view.constraints.count, 1)
        XCTAssertEqual(view.constraints[0].constant, height)
    }
    
    func testWithSizeMethod_withWidthAndHeightParameters() throws {
        let width: CGFloat = 123
        let height: CGFloat = 456
        let view = UIView().withSize(width: width, height: height)
        
        let widthConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .width }).first)
        let heightConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .height }).first)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(widthConstraint.constant, width)
        XCTAssertEqual(heightConstraint.constant, height)
    }
    
    func testWithBorderMethod() throws {
        // Defaults
        let defaultBorderWidth: CGFloat = 4
        let defaultBorderColor: UIColor = .black
        let view = UIView().withBorder()
        
        XCTAssertEqual(view.layer.borderWidth, defaultBorderWidth)
        XCTAssertEqual(view.layer.borderColor, defaultBorderColor.cgColor)
        
        // Border width
        let borderWidth: CGFloat = 8
        view.withBorder(width: borderWidth)
        
        XCTAssertEqual(view.layer.borderWidth, borderWidth)
        XCTAssertEqual(view.layer.borderColor, defaultBorderColor.cgColor)
        
        // Border color
        let borderColor: UIColor = .blue
        view.withBorder(color: borderColor)
        
        XCTAssertEqual(view.layer.borderWidth, defaultBorderWidth)
        XCTAssertEqual(view.layer.borderColor, borderColor.cgColor)
    }

    
    func testWithShadowMethod() throws {
        // Defaults
        let defaultOpacity: Float = 0
        let defaultRadius: CGFloat = 0
        let defaultOffset: CGSize = .zero
        let defaultColor: UIColor = .black
        
        let view = UIView().withShadow()
        
        XCTAssertEqual(view.layer.shadowOpacity, defaultOpacity)
        XCTAssertEqual(view.layer.shadowRadius, defaultRadius)
        XCTAssertEqual(view.layer.shadowOffset, defaultOffset)
        XCTAssertEqual(view.layer.shadowColor, defaultColor.cgColor)
    }
}
