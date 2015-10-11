//
//  Schema.swift
//  Lattice
//
//  Created by Fabian Canas on 10/10/15.
//  Copyright © 2015 Fabián Cañas. All rights reserved.
//

import Foundation

enum FieldType {
    case Text
    case Integer
}

extension FieldType {
    var size :Int {
        get {
            switch self {
            case .Text:
                return 128
            case .Integer:
                return 8
            }
        }
    }
}

struct Column {
    let name :String
    let type :FieldType
}

struct Schema {
    let columns :[Column]
}

struct Table {
    let schema :Schema
}
