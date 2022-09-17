//
//  FrameViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol FrameViewable: UIView {}

public extension FrameViewable {

    func frame(
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) -> Wrappers<Self, Self>.Frame {
        .init(
            original: self,
            wrapped: self,
            width: width,
            height: height
        )
    }
}

public extension FrameViewable where Self: WrapperViewable {

    func frame(
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) -> Wrappers<OriginalView, Self>.Frame {
        .init(
            original: originalView,
            wrapped: self,
            width: width,
            height: height
        )
    }
}

extension UIView: FrameViewable {}
