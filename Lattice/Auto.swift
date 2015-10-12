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
    init(model: Model) {
        let mirror = Mirror(reflecting: model)
        var t = Array<FieldType>()
        var n = Array<String?>()
        indices = Dictionary<String,Int>()
        for child in mirror.children {
            if let type = FieldType.type(child.value) {
                t.append(type)
                if let label = child.label where mirror.displayStyle != .Tuple {
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
    init(model: T) {
        schema = Schema(model: model)
    }
}
