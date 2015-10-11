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
        let s = Schema(model: Mirror(reflecting: bill))
        XCTAssertEqual(s.columns.count, 2, "Automatically generate schema should have the correc tnumber of columns")
        
        XCTAssert(s.columns[0].name == "name" || s.columns[0].name == "birthYear")
        
        for col in s.columns {
            if col.name == "name" {
                XCTAssert(col.type == .Text)
            } else if col.name == "birthYear"{
                XCTAssert(col.type == .Integer)
            }
        }
    }
    
    func testTupleSchema() {
        let bill = (name: "Bill", birthYear: 1955)
        let s = Schema(model: Mirror(reflecting: bill))
        XCTAssertEqual(s.columns.count, 2, "Automatically generate schema should have the correc tnumber of columns")
        
        XCTAssert(s.columns[0].name == ".0" || s.columns[0].name == ".1")
        
        for col in s.columns {
            if col.name == ".0" {
                XCTAssert(col.type == .Text)
            } else if col.name == ".1"{
                XCTAssert(col.type == .Integer)
            }
        }
    }
    
}
