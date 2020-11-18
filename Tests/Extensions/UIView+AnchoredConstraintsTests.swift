//
//  UIView+AnchoredConstraintsTests.swift
//  LayoutItKit-iOSTests
//
//  Created by Abraao Levi on 06/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

@testable import LayoutItKit
import XCTest

class UIView_AnchoredConstraintsTests: XCTestCase {
    
    func testAddSubviewAndFillSuperview() throws {
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        let view = UIView()
        
        superview.addSubviewAndFillSuperview(view)
        
        XCTAssertEqual(superview.subviews.first, view)
        
        let topAnchor = try XCTUnwrap(superview
                                        .constraints
                                        .filter({ $0.firstAttribute == .top })
                                        .first)
        
        let leadingAnchor = try XCTUnwrap(superview
                                            .constraints
                                            .filter({ $0.firstAttribute == .leading })
                                            .first)
        
        let bottomAnchor = try XCTUnwrap(superview
                                            .constraints
                                            .filter({ $0.firstAttribute == .bottom })
                                            .first)
        
        let trailingAnchor = try XCTUnwrap(superview
                                            .constraints
                                            .filter({ $0.firstAttribute == .trailing })
                                            .first)
        
        XCTAssertEqual(topAnchor.firstItem as? UIView, view)
        XCTAssertEqual(leadingAnchor.firstItem as? UIView, view)
        XCTAssertEqual(bottomAnchor.firstItem as? UIView, view)
        XCTAssertEqual(trailingAnchor.firstItem as? UIView, view)
    }

    func testAnchor_withAnhors() throws {
        let view = UIView()
        let otherView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        otherView.addSubview(view)
        
        let anchoredConstraints = view.anchor(
            .top(otherView.topAnchor, constant: 1),
            .leading(otherView.leadingAnchor, constant: 2),
            .bottom(otherView.bottomAnchor, constant: 3),
            .trailing(otherView.trailingAnchor, constant: 4),
            .height(300),
            .width(400)
        )
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        
        let topAnchor = try XCTUnwrap(anchoredConstraints.top)
        let leadingAnchor = try XCTUnwrap(anchoredConstraints.leading)
        let bottomAnchor = try XCTUnwrap(anchoredConstraints.bottom)
        let trailingAnchor = try XCTUnwrap(anchoredConstraints.trailing)
        let widthAnchor = try XCTUnwrap(anchoredConstraints.width)
        let heightAnchor = try XCTUnwrap(anchoredConstraints.height)
        
        XCTAssertTrue(topAnchor.isActive)
        XCTAssertTrue(leadingAnchor.isActive)
        XCTAssertTrue(bottomAnchor.isActive)
        XCTAssertTrue(trailingAnchor.isActive)
        XCTAssertTrue(widthAnchor.isActive)
        XCTAssertTrue(heightAnchor.isActive)
        
        XCTAssertEqual(topAnchor.constant, 1)
        XCTAssertEqual(leadingAnchor.constant, 2)
        XCTAssertEqual(bottomAnchor.constant, -3)
        XCTAssertEqual(trailingAnchor.constant, -4)
        XCTAssertEqual(widthAnchor.constant, 400)
        XCTAssertEqual(heightAnchor.constant, 300)
    }
    
    func testAnchor_withNamedParameters() throws {
        let view = UIView()
        let otherView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        otherView.addSubview(view)
        
        let anchoredConstraints = view.anchor(
            top: otherView.topAnchor,
            leading: otherView.leadingAnchor,
            bottom: otherView.bottomAnchor,
            trailing: otherView.trailingAnchor,
            padding: .init(top: 10, left: 20, bottom: 30, right: 40),
            size: .init(width: 100, height: 200)
        )
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        
        let topAnchor = try XCTUnwrap(anchoredConstraints.top)
        let leadingAnchor = try XCTUnwrap(anchoredConstraints.leading)
        let bottomAnchor = try XCTUnwrap(anchoredConstraints.bottom)
        let trailingAnchor = try XCTUnwrap(anchoredConstraints.trailing)
        let widthAnchor = try XCTUnwrap(anchoredConstraints.width)
        let heightAnchor = try XCTUnwrap(anchoredConstraints.height)
        
        XCTAssertTrue(topAnchor.isActive)
        XCTAssertTrue(trailingAnchor.isActive)
        XCTAssertTrue(bottomAnchor.isActive)
        XCTAssertTrue(leadingAnchor.isActive)
        XCTAssertTrue(widthAnchor.isActive)
        XCTAssertTrue(heightAnchor.isActive)
        
        XCTAssertEqual(topAnchor.constant, 10)
        XCTAssertEqual(leadingAnchor.constant, 20)
        XCTAssertEqual(bottomAnchor.constant, -30)
        XCTAssertEqual(trailingAnchor.constant, -40)
        XCTAssertEqual(widthAnchor.constant, 100)
        XCTAssertEqual(heightAnchor.constant, 200)
    }
    
    func testFillSuperview_withViewWithoutSuperview() throws {
        let view = UIView()
        
        let anchoredConstraints = view.fillSuperview()
        
        XCTAssertNil(anchoredConstraints.top)
        XCTAssertNil(anchoredConstraints.leading)
        XCTAssertNil(anchoredConstraints.bottom)
        XCTAssertNil(anchoredConstraints.trailing)
    }
    
    func testFillSuperview_withViewWithSuperview() throws {
        let view = UIView()
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        superview.addSubview(view)
        
        let anchoredConstraints = view.fillSuperview()
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        
        let topAnchor = try XCTUnwrap(anchoredConstraints.top)
        let leadingAnchor = try XCTUnwrap(anchoredConstraints.leading)
        let bottomAnchor = try XCTUnwrap(anchoredConstraints.bottom)
        let trailingAnchor = try XCTUnwrap(anchoredConstraints.trailing)

        XCTAssertEqual(topAnchor.secondAnchor, superview.topAnchor)
        XCTAssertEqual(leadingAnchor.secondAnchor, superview.leadingAnchor)
        XCTAssertEqual(bottomAnchor.secondAnchor, superview.bottomAnchor)
        XCTAssertEqual(trailingAnchor.secondAnchor, superview.trailingAnchor)
    }

    func testFillSuperviewSafeAreaLayoutGuide_withViewWithoutSuperview() throws {
        let view = UIView()
        
        let anchoredConstraints = view.fillSuperviewSafeAreaLayoutGuide()
        
        XCTAssertNil(anchoredConstraints.top)
        XCTAssertNil(anchoredConstraints.leading)
        XCTAssertNil(anchoredConstraints.bottom)
        XCTAssertNil(anchoredConstraints.trailing)
    }
    
    
    func testFillSuperviewSafeAreaLayoutGuide_withViewWithSuperview() throws {
        let view = UIView()
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        
        superview.addSubview(view)
        
        let anchoredConstraints = view.fillSuperviewSafeAreaLayoutGuide()
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        
        let topAnchor = try XCTUnwrap(anchoredConstraints.top)
        let leadingAnchor = try XCTUnwrap(anchoredConstraints.leading)
        let bottomAnchor = try XCTUnwrap(anchoredConstraints.bottom)
        let trailingAnchor = try XCTUnwrap(anchoredConstraints.trailing)

        XCTAssertEqual(topAnchor.secondAnchor, superview.safeAreaLayoutGuide.topAnchor)
        XCTAssertEqual(leadingAnchor.secondAnchor, superview.safeAreaLayoutGuide.leadingAnchor)
        XCTAssertEqual(bottomAnchor.secondAnchor, superview.safeAreaLayoutGuide.bottomAnchor)
        XCTAssertEqual(trailingAnchor.secondAnchor, superview.safeAreaLayoutGuide.trailingAnchor)
    }
    
    func testConstraintHeight() throws {
        let height: CGFloat = 12
        let view = UIView()
        
        let anchoredConstraints = view.constrainHeight(height)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        
        let heightAnchor = try XCTUnwrap(anchoredConstraints.height)
        XCTAssertEqual(heightAnchor.constant, height)
    }
    
    func testConstrainWidth() throws {
        let width: CGFloat = 24
        let view = UIView()
        
        let anchoredConstraints = view.constrainWidth(width)
        
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
        
        let widthAnchor = try XCTUnwrap(anchoredConstraints.width)
        XCTAssertEqual(widthAnchor.constant, width)
    }
}
