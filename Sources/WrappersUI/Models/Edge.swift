//
//  Edge.swift
//
//
//  Created by onnerb on 15/09/22.
//

import Foundation

public enum Edge: UInt8, CaseIterable {

    case top
    case bottom
    case leading
    case trailing
}

extension Edge {

    public struct Set: OptionSet {

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        init(_ edges: Edge) {
            self.init(rawValue: 1 << (edges.rawValue + 1))
        }
    }
}

extension Edge.Set {

    public static let top = Edge.Set(.top)
    public static let bottom = Edge.Set(.bottom)
    public static let leading = Edge.Set(.leading)
    public static let trailing = Edge.Set(.trailing)
}

extension Edge.Set {

    public static var topLeft: Self {
        [.top, .leading]
    }

    public static var topRight: Self {
        [.top, .trailing]
    }

    public static var bottomLeft: Self {
        [.bottom, .leading]
    }

    public static var bottomRight: Self {
        [.bottom, .trailing]
    }

    public static var vertical: Self {
        [.top, .bottom]
    }

    public static var horizontal: Self {
        [.leading, .trailing]
    }

    public static var all: Self {
        [.top, .bottom, .leading, .trailing]
    }
}
