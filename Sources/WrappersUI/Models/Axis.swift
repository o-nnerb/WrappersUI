//
//  File.swift
//
//
//  Created by onnerb on 17/09/22.
//

import Foundation

public enum Axis: UInt8, CaseIterable {

    case vertical
    case horizontal
}

extension Axis {

    public struct Set: OptionSet {

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        init(_ edges: Axis) {
            self.init(rawValue: 1 << (edges.rawValue + 1))
        }
    }
}

extension Axis.Set {

    public static let vertical = Axis.Set(.vertical)
    public static let horizontal = Axis.Set(.horizontal)
}
