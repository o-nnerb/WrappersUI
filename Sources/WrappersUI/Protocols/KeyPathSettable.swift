//
//  KeyPathSettable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import Foundation

@MainActor
public protocol KeyPathSettable {}

extension KeyPathSettable {

    public func setting<Value>(
        _ keyPath: WritableKeyPath<Self, Value>,
        to value: Value
    ) -> Self {
        var mutableSelf = self
        mutableSelf[keyPath: keyPath] = value
        return mutableSelf
    }
}

extension KeyPathSettable {

    public func setup(_ setup: @MainActor (inout Self) -> Void) -> Self {
        var mutableSelf = self
        setup(&mutableSelf)
        return mutableSelf
    }
}

extension KeyPathSettable {

    public func assign(to reference: inout Self) -> Self {
        reference = self
        return self
    }

    public func assign(to reference: inout Self?) -> Self {
        reference = self
        return self
    }
}
