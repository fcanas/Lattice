//
//  Auto.swift
//  Lattice
//
//  Created by Fabian Canas on 10/10/15.
//  Copyright © 2015 Fabián Cañas. All rights reserved.
//

import Foundation

extension FieldType {
    static func type(value: Any) -> FieldType? {
        if value.dynamicType == Int.self {
            return .Integer
        }
        if value.dynamicType == String.self {
            return .Text
        }
        return nil
    }
}

extension Schema {
    init(model: Mirror) {
        var t = Array<FieldType>()
        var n = Array<String?>()
        indices = Dictionary<String,Int>()
        for child in model.children {
            if let type = FieldType.type(child.value) {
                t.append(type)
                if let label = child.label where model.displayStyle != .Tuple {
                    n.append(child.label)
                    indices[label] = n.count - 1
                } else {
                    n.append(nil)
                }
            }
        }
        names = n
        types = t
    }
}

extension Table {
    init(model: Any) {
        schema = Schema(model: Mirror(reflecting: model))
    }
}
