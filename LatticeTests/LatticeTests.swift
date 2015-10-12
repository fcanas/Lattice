//
//  LatticeTests.swift
//  LatticeTests
//
//  Created by Fabian Canas on 10/10/15.
//  Copyright © 2015 Fabián Cañas. All rights reserved.
//

import XCTest
@testable import Lattice

struct Person {
    var name :String
    var birthYear :Int
}

class LatticeTests: XCTestCase {
    
    func testIntegerFieldType() {
        XCTAssertTrue(FieldType.type(5) == .Integer, "Integer values should yield an integer field type")
        XCTAssertFalse(FieldType.type("Hello") == .Integer, "String values should not yield an integer field type")
    }
    
    func testStringFieldType() {
        XCTAssertTrue(FieldType.type("Hi") == .Text, "String values should yield a text field type")
        XCTAssertFalse(FieldType.type(4) == .Text, "Integer values should not yield text field type")
    }
    
    func testStructSchema() {
        let bill = Person(name: "Bill", birthYear: 1955)
        let s = Schema(model: bill)
        XCTAssertEqual(s.types.count, 2, "Automatically generate schema should have the correct number of types")
        XCTAssertEqual(s.types[s.index("name")!], FieldType.Text)
        XCTAssertEqual(s.types[s.index("birthYear")!], FieldType.Integer)
    }
    
    func testTupleSchema() {
        let bill = (name: "Bill", birthYear: 1955)
        let s = Schema(model: bill)
        XCTAssertEqual(s.types.count, 2, "Automatically generate schema should have the correct number of types")
        XCTAssertEqual(s.types[0], FieldType.Text)
        XCTAssertEqual(s.types[1], FieldType.Integer)
        XCTAssertNil(s.names[0], "Tuple fields should be unnamed")
        XCTAssertNil(s.names[1], "Tuple fields should have nil placeholder for names")
    }
    
}
