//
//  UILabelTests.swift
//  LayoutItKit-iOSTests
//
//  Created by Abraao on 02/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

@testable import LayoutItKit
import XCTest

class UILabelTests: XCTestCase {
    
    static var allTests = [
        ("testInit", testInit),
        ("testWithText", testWithText),
        ("testWithFont", testWithFont),
        ("testWithTextColor", testWithTextColor),
        ("testTextAlignment", testTextAlignment),
        ("testWithNumberOfLines", testWithNumberOfLines),
    ]

    func testInit() {
        // Given
        let text = "MyTest"
        let font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        let textColor = UIColor.blue
        let textAlignment = NSTextAlignment.center
        let numberOfLines = 10
        
        // When
        let label = UILabel(text: text,
                            font: font,
                            textColor: textColor,
                            textAlignment: textAlignment,
                            numberOfLines: numberOfLines)
        // Then
        XCTAssertEqual(text, label.text)
        XCTAssertEqual(font, label.font)
        XCTAssertEqual(textColor, label.textColor)
        XCTAssertEqual(textAlignment, label.textAlignment)
        XCTAssertEqual(numberOfLines, label.numberOfLines)
    }
    
    func testWithText() {
        // Given
        let text = "MyTest"

        // When
        let label = UILabel().withText(text)
        
        // Then
        XCTAssertEqual(text, label.text)
    }
    
    func testWithFont() {
        // Given
        let font = UIFont.systemFont(ofSize: 20, weight: .semibold)

        // When
        let label = UILabel().withFont(font)
        
        // Then
        XCTAssertEqual(font, label.font)
    }

    func testWithTextColor() {
        // Given
        let textColor = UIColor.blue

        // When
        let label = UILabel().withTextColor(textColor)
        
        // Then
        XCTAssertEqual(textColor, label.textColor)
    }
    
    func testTextAlignment() {
        // Given
        let textAlignment = NSTextAlignment.center
        
        // When
        let label = UILabel().withTextAlignment(textAlignment)
        
        // Then
        XCTAssertEqual(textAlignment, label.textAlignment)
    }

    func testWithNumberOfLines() {
        // Given
        let numberOfLines = 10
        
        // When
        let label = UILabel().withNumberOfLines(numberOfLines)
        
        // Then
        XCTAssertEqual(numberOfLines, label.numberOfLines)
    }
}
