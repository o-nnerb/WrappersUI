//
//  OverlayViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol OverlayViewable: UIView {}

public extension OverlayViewable {

    func overlay<Overlay: UIView>(
        _ overlay: Overlay,
        alignment: WrappersUI.Alignment? = nil,
        priority: UILayoutPriority = .required
    ) -> Wrappers<Self, Self>.Overlay<Overlay> {
        .init(
            original: self,
            wrapped: self,
            overlay: overlay,
            edges: alignment,
            priority: priority
        )
    }
}

public extension OverlayViewable where Self: WrapperViewable {

    func overlay<Overlay: UIView>(
        _ overlay: Overlay,
        alignment: WrappersUI.Alignment? = nil,
        priority: UILayoutPriority = .required
    ) -> Wrappers<OriginalView, Self>.Overlay<Overlay> {
        .init(
            original: originalView,
            wrapped: self,
            overlay: overlay,
            edges: alignment,
            priority: priority
        )
    }
}

extension UIView: OverlayViewable {}
