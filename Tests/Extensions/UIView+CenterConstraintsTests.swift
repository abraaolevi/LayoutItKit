//
//  UIView+CenterConstraintsTests.swift
//  LayoutItKit-iOSTests
//
//  Created by Abraao Levi on 07/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

@testable import LayoutItKit
import XCTest

class UIView_CenterConstraintsTests: XCTestCase {

    func testCenterInSuperview() throws {
        let size = CGSize(width: 25, height: 50)
        let view = UIView()
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        superview.addSubview(view)
        
        view.centerInSuperview(size: size)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        
        let anchoredViewX = try XCTUnwrap(superview
                                        .constraints
                                        .filter({ $0.firstAttribute == .centerX })
                                        .first?
                                        .firstItem as? UIView)
        
        let anchoredViewY = try XCTUnwrap(superview
                                        .constraints
                                        .filter({ $0.firstAttribute == .centerY })
                                        .first?
                                        .firstItem as? UIView)
        
        let widthAnchor = try XCTUnwrap(view
                                        .constraints
                                        .filter({ $0.firstAttribute == .width })
                                        .first)
        
        let heightAnchor = try XCTUnwrap(view
                                        .constraints
                                        .filter({ $0.firstAttribute == .height })
                                        .first)
        
        XCTAssertEqual(view, anchoredViewX)
        XCTAssertEqual(view, anchoredViewY)
        XCTAssertEqual(widthAnchor.constant, size.width)
        XCTAssertEqual(heightAnchor.constant, size.height)
    }
    
    func testCenterXTo() throws {
        let view = UIView()
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        superview.addSubview(view)
        
        view.centerXTo(superview.centerXAnchor)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)

        let anchoredViewX = try XCTUnwrap(superview
                                        .constraints
                                        .filter({ $0.firstAttribute == .centerX })
                                        .first?
                                        .firstItem as? UIView)

        XCTAssertEqual(view, anchoredViewX)
    }
    
    func testCenterYTo() throws {
        let view = UIView()
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        superview.addSubview(view)
        
        view.centerYTo(superview.centerYAnchor)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)

        let anchoredViewY = try XCTUnwrap(superview
                                        .constraints
                                        .filter({ $0.firstAttribute == .centerY })
                                        .first?
                                        .firstItem as? UIView)

        XCTAssertEqual(view, anchoredViewY)
    }
    
    func testCenterXToSuperview() throws {
        let view = UIView()
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        superview.addSubview(view)
        
        view.centerXToSuperview()
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)

        let anchoredViewX = try XCTUnwrap(superview
                                        .constraints
                                        .filter({ $0.firstAttribute == .centerX })
                                        .first?
                                        .firstItem as? UIView)

        XCTAssertEqual(view, anchoredViewX)
    }

    func testCenterYToSuperview() throws {
        let view = UIView()
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        superview.addSubview(view)
        
        view.centerYToSuperview()
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)

        let anchoredViewY = try XCTUnwrap(superview
                                        .constraints
                                        .filter({ $0.firstAttribute == .centerY })
                                        .first?
                                        .firstItem as? UIView)

        XCTAssertEqual(view, anchoredViewY)
    }
}
