//
//  Smart_DesignTests.swift
//  Smart DesignTests
//
//  Created by Nurlan Dadashbayli on 05.12.22.
//

import XCTest

final class Calculator_Tests: XCTestCase {
    
    private var sut: Calculators!
    
    override func setUpWithError() throws {
        sut = Calculators()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func testCalculateArea() {
        // Test for positive input
        let positive = sut.calculateArea(roomWidth: "10", roomDepth: "15")
        XCTAssertEqual(positive, "150.0")
        
        // Test for negative input
        let negative = sut.calculateArea(roomWidth: "-10", roomDepth: "15")
        XCTAssertEqual(negative, "Enter a positive value")
        
        // Test for input that is too large
        let large = sut.calculateArea(roomWidth: "2000", roomDepth: "15")
        XCTAssertEqual(large, "Value is too large")
        
        // Test for text input
        let text = sut.calculateArea(roomWidth: "Mario", roomDepth: "Bros")
        XCTAssertEqual(text, "Enter a positive value")
        
        // Test for emoji input
        let emoji = sut.calculateArea(roomWidth: "🤔", roomDepth: "🤷‍♂️")
        XCTAssertEqual(emoji, "Enter a positive value")
        
        // Test for small input
        let small = sut.calculateArea(roomWidth: "0.00001", roomDepth: "15")
        XCTAssertEqual(small, "Value is too small")
    }
    
    func testCalculateScreenDiagonal() {
        // Test for positive input
        let positive = sut.calculateScreenDiagonal(roomWidth: "10")
        XCTAssertEqual(positive, "120.0")
        
        // Test for negative input
        let negative = sut.calculateScreenDiagonal(roomWidth: "-10")
        XCTAssertEqual(negative, "Enter a positive value")
        
        // Test for input that is too large
        let large = sut.calculateScreenDiagonal(roomWidth: "2000")
        XCTAssertEqual(large, "Value is too large")
        
        // Test for text input
        let text = sut.calculateScreenDiagonal(roomWidth: "Mario")
        XCTAssertEqual(text, "Enter a positive value")
        
        // Test for emoji input
        let emoji = sut.calculateScreenDiagonal(roomWidth: "🤔")
        XCTAssertEqual(emoji, "Enter a positive value")
        
        // Test for small input
        let small = sut.calculateScreenDiagonal(roomWidth: "0.00001")
        XCTAssertEqual(small, "Value is too small")
        
    }
    
    func testCalculateScreenWidth() {
        // Test for positive input
        let positive = sut.calculateScreenWidth(roomWidth: "10")
        XCTAssertEqual(positive, "104.62044302222755")
        
        // Test for negative input
        let negative = sut.calculateScreenWidth(roomWidth: "-10")
        XCTAssertEqual(negative, "Enter a positive value")
        
        // Test for input that is too large
        let large = sut.calculateScreenWidth(roomWidth: "2000")
        XCTAssertEqual(large, "Value is too large")
        
        // Test for text input
        let text = sut.calculateScreenWidth(roomWidth: "Mario")
        XCTAssertEqual(text, "Enter a positive value")
        
        // Test for emoji input
        let emoji = sut.calculateScreenWidth(roomWidth: "🤔")
        XCTAssertEqual(emoji, "Enter a positive value")
        
        // Test for small input
        let small = sut.calculateScreenWidth(roomWidth: "0.00001")
        XCTAssertEqual(small, "Value is too small")
    }
    
    func testCalculateScreenHeight() {
        // Test for positive input
        let positive = sut.calculateScreenHeight(roomWidth: "10")
        XCTAssertEqual(positive, "58.775529787768285")
        
        // Test for negative input
        let negative = sut.calculateScreenHeight(roomWidth: "-10")
        XCTAssertEqual(negative, "Enter a positive value")
        
        // Test for input that is too large
        let large = sut.calculateScreenHeight(roomWidth: "2000")
        XCTAssertEqual(large, "Value is too large")
        
        // Test for text input
        let text = sut.calculateScreenHeight(roomWidth: "Mario")
        XCTAssertEqual(text, "Enter a positive value")
        
        // Test for emoji input
        let emoji = sut.calculateScreenHeight(roomWidth: "🤔")
        XCTAssertEqual(emoji, "Enter a positive value")
        
        // Test for small input
        let small = sut.calculateScreenHeight(roomWidth: "0.00001")
        XCTAssertEqual(small, "Value is too small")
    }
    
    func testCalculateLongestAllowableViewingDistance() {
        let roomWidth = "10"
        let lvdExpected = 5.7551437464664525
        let lvdActual = sut.calculateLongestAllowableViewingDistance(roomWidth: roomWidth)
        XCTAssertEqual(lvdActual, lvdExpected)
    }
    
    func testCalculateShortesRecommendedViewingDistance() {
        let roomWidth = "10"
        let svdExpected = 1.8975511600159383
        let svdActual = sut.calculateShortesRecommendedViewingDistance(roomWidth: roomWidth)
        XCTAssertEqual(svdActual, svdExpected)
    }
    func testCalculateNumberOfPeople() {
        // Test for positive input
        let positive = sut.calculateNumberOfPeople(roomWidth: "10")
        XCTAssertEqual(positive, "30.0")

        // Test for negative input
        let negative = sut.calculateNumberOfPeople(roomWidth: "-10")
        XCTAssertEqual(negative, "Enter a positive value")

        // Test for input that is too large
        let large = sut.calculateNumberOfPeople(roomWidth: "2000")
        XCTAssertEqual(large, "Value is too large")

        // Test for text input
        let text = sut.calculateNumberOfPeople(roomWidth: "Mario")
        XCTAssertEqual(text, "Enter a positive value")

        // Test for emoji input
        let emoji = sut.calculateNumberOfPeople(roomWidth: "🤔")
        XCTAssertEqual(emoji, "Enter a positive value")

        // Test for small input
        let small = sut.calculateNumberOfPeople(roomWidth: "0.00001")
        XCTAssertEqual(small, "Value is too small")
    }
    
    func testCalculateLamps() {
        // Test for positive input
        let positive = sut.calculateLamps(roomWidth: "10", roomDepth: "20")
        XCTAssertEqual(positive, "25.0")

        // Test for negative input
        let negative = sut.calculateLamps(roomWidth: "-10", roomDepth: "-20")
        XCTAssertEqual(negative, "Enter a positive value")

        // Test for input that is too large
        let large = sut.calculateLamps(roomWidth: "2000", roomDepth: "1000")
        XCTAssertEqual(large, "Value is too large")

        // Test for text input
        let text = sut.calculateLamps(roomWidth: "Mario", roomDepth: "Luigi")
        XCTAssertEqual(text, "Enter a positive value")

        // Test for emoji input
        let emoji = sut.calculateLamps(roomWidth: "🤔", roomDepth: "🤷‍♂️")
        XCTAssertEqual(emoji, "Enter a positive value")

        // Test for small input
        let small = sut.calculateLamps(roomWidth: "0.00001", roomDepth: "0.00001")
        XCTAssertEqual(small, "Value is too small")
    }
}
