//
//  PaddingViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import SwiftUI

@MainActor
public protocol PaddingViewable: UIView {}

public extension PaddingViewable {

    func padding(
        _ edgesInsets: UIEdgeInsets
    ) -> Wrappers<Self, Self>.Padding {
        .init(
            original: self,
            wrapped: self,
            edges: edgesInsets
        )
    }

    func padding(
        _ edges: Edge.Set = .all,
        _ constant: CGFloat
    ) -> Wrappers<Self, Self>.Padding {
        padding(.init(
            top: edges.contains(.top) ? constant : .zero,
            left: edges.contains(.leading) ? constant : .zero,
            bottom: edges.contains(.bottom) ? constant : .zero,
            right: edges.contains(.trailing) ? constant : .zero
        ))
    }
}

public extension PaddingViewable where Self: WrapperViewable {

    func padding(
        _ edgesInsets: UIEdgeInsets
    ) -> Wrappers<OriginalView, Self>.Padding {
        .init(
            original: originalView,
            wrapped: self,
            edges: edgesInsets
        )
    }

    func padding(
        _ edges: Edge.Set = .all,
        _ constant: CGFloat
    ) -> Wrappers<OriginalView, Self>.Padding {
        padding(.init(
            top: edges.contains(.top) ? constant : .zero,
            left: edges.contains(.leading) ? constant : .zero,
            bottom: edges.contains(.bottom) ? constant : .zero,
            right: edges.contains(.trailing) ? constant : .zero
        ))
    }
}

extension UIView: PaddingViewable {}
