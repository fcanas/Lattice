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
        var cols = Array<Column>()
        for child in model.children {
            if let label = child.label, let type = FieldType.type(child.value) {
                cols.append(Column(name: label, type: type))
            }
        }
        columns = cols
    }
}

extension Table {
    init(model: Any) {
        schema = Schema(model: Mirror(reflecting: model))
    }
}
