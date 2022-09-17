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
        _ insets: EdgeInsets
    ) -> Wrappers<Self, Self>.Padding {
        .init(
            original: self,
            wrapped: self,
            edges: insets
        )
    }

    func padding(
        _ edges: Edge.Set = .all,
        _ length: CGFloat? = nil
    ) -> Wrappers<Self, Self>.Padding {
        let length = length ?? 16

        return padding(.init(
            top: edges.contains(.top) ? length : .zero,
            leading: edges.contains(.leading) ? length : .zero,
            bottom: edges.contains(.bottom) ? length : .zero,
            trailing: edges.contains(.trailing) ? length : .zero
        ))
    }

    func padding(_ length: CGFloat) -> Wrappers<Self, Self>.Padding {
        padding(.all, length)
    }
}

public extension PaddingViewable where Self: WrapperViewable {

    func padding(
        _ insets: EdgeInsets
    ) -> Wrappers<OriginalView, Self>.Padding {
        .init(
            original: originalView,
            wrapped: self,
            edges: insets
        )
    }

    func padding(
        _ edges: Edge.Set = .all,
        _ length: CGFloat? = nil
    ) -> Wrappers<OriginalView, Self>.Padding {
        let length = length ?? 16

        return padding(.init(
            top: edges.contains(.top) ? length : .zero,
            leading: edges.contains(.leading) ? length : .zero,
            bottom: edges.contains(.bottom) ? length : .zero,
            trailing: edges.contains(.trailing) ? length : .zero
        ))
    }

    func padding(_ length: CGFloat) -> Wrappers<OriginalView, Self>.Padding {
        padding(.all, length)
    }
}

extension UIView: PaddingViewable {}
