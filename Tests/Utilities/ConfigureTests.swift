//
//  ConfigureTests.swift
//  LayoutItKit-iOSTests
//
//  Created by Abraao Levi on 06/11/20.
//  Copyright © 2020 LayoutItKit. All rights reserved.
//

@testable import LayoutItKit
import XCTest

class ConfigureTests: XCTestCase {

    let text = "MyTest"
    let font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    let textColor = UIColor.blue
    let textAlignment = NSTextAlignment.center
    let numberOfLines = 10
    
    func testConfigureReturningTheElement() throws {
        // When
        let label = configure(UILabel()) {
            $0.text = text
            $0.font = font
            $0.textColor = textColor
            $0.textAlignment = textAlignment
            $0.numberOfLines = numberOfLines
        }
        
        // Then
        XCTAssertEqual(text, label.text)
        XCTAssertEqual(font, label.font)
        XCTAssertEqual(textColor, label.textColor)
        XCTAssertEqual(textAlignment, label.textAlignment)
        XCTAssertEqual(numberOfLines, label.numberOfLines)
    }
    
    func testConfigureWithoutReturnElement() throws {
        // Given
        let label = UILabel()

        // When
        configure(label) {
            $0.text = text
            $0.font = font
            $0.textColor = textColor
            $0.textAlignment = textAlignment
            $0.numberOfLines = numberOfLines
        }
        
        // When
        XCTAssertEqual(text, label.text)
        XCTAssertEqual(font, label.font)
        XCTAssertEqual(textColor, label.textColor)
        XCTAssertEqual(textAlignment, label.textAlignment)
        XCTAssertEqual(numberOfLines, label.numberOfLines)
    }

}
