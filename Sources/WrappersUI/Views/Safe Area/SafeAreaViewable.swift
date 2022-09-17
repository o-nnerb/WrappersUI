//
//  SafeAreaViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol SafeAreaViewable: UIView {}

public extension SafeAreaViewable {

    func safeArea(
        _ edges: Edge.Set
    ) -> Wrappers<Self, Self>.SafeArea {
        .init(
            original: self,
            wrapped: self,
            edges: edges
        )
    }
}

public extension SafeAreaViewable where Self: WrapperViewable {

    func safeArea(
        _ edges: Edge.Set
    ) -> Wrappers<OriginalView, Self>.SafeArea {
        .init(
            original: originalView,
            wrapped: self,
            edges: edges
        )
    }
}

extension UIView: SafeAreaViewable {}
