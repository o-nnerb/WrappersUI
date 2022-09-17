//
//  RoundedViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import Foundation
import UIKit

@MainActor
public protocol RoundedViewable: UIView {}

public extension RoundedViewable {

    func cornerRadius(_ constant: CGFloat) -> Wrappers<Self, Self>.Rounded {
        .init(
            original: self,
            wrapped: self,
            constant: constant
        )
    }

    func circular() -> Wrappers<Self, Self>.Rounded {
        .init(
            original: self,
            wrapped: self,
            constant: .infinity
        )
    }
}

public extension RoundedViewable where Self: WrapperViewable {

    func cornerRadius(_ constant: CGFloat) -> Wrappers<OriginalView, Self>.Rounded {
        .init(
            original: originalView,
            wrapped: self,
            constant: constant
        )
    }

    func circular() -> Wrappers<OriginalView, Self>.Rounded {
        .init(
            original: originalView,
            wrapped: self,
            constant: .infinity
        )
    }
}

extension UIView: RoundedViewable {}
