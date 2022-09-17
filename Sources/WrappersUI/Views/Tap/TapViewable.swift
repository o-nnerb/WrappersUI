//
//  TapViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol TapViewable: UIView {}

extension TapViewable {

    public func onTapGesture(
        perform action: @escaping () -> Void
    ) -> Wrappers<Self, Self>.Tap {
        .init(
            original: self,
            wrapped: self,
            perform: action
        )
    }
}

extension TapViewable where Self: WrapperViewable {

    public func onTapGesture(
        perform action: @escaping () -> Void
    ) -> Wrappers<OriginalView, Self>.Tap {
        .init(
            original: originalView,
            wrapped: self,
            perform: action
        )
    }
}

extension UIView: TapViewable {}
