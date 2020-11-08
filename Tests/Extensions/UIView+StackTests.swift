//
//  UIView+StackTests.swift
//  LayoutItKit-iOSTests
//
//  Created by Abraao Levi on 08/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

import XCTest

class UIView_StackTests: XCTestCase {

    func testStack() throws {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

        let stackView = view.stack(views: [
            UILabel(text: "Label 1"),
            UILabel(text: "Label 2"),
            UILabel(text: "Label 3"),
            UILabel(text: "Label 4")
        ])
        
        let topConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .top }).first)
        let leadingConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .leading }).first)
        let bottomConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .bottom }).first)
        let trailingConstraint = try XCTUnwrap(view.constraints.filter({ $0.firstAttribute == .trailing }).first)
        
        XCTAssertEqual(topConstraint.firstItem as? UIView, stackView)
        XCTAssertEqual(leadingConstraint.firstItem as? UIView, stackView)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, stackView)
        XCTAssertEqual(trailingConstraint.firstItem as? UIView, stackView)
    }

}
