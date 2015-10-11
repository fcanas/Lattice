//
//  Schema.swift
//  Lattice
//
//  Created by Fabian Canas on 10/10/15.
//  Copyright © 2015 Fabián Cañas. All rights reserved.
//

import Foundation

public enum FieldType {
    case Text
    case Integer
}

public struct Schema {
    /// An array of types in order
    public let types :[FieldType]
    
    /// An array of names in order
    public let names :[String?]
    
    internal var indices :Dictionary<String,Int>
    
    /// Returns the index of a column for a given name
    public func index(name :String) -> Int? {
        return indices[name]
    }
}

struct Table {
    let schema :Schema
}
