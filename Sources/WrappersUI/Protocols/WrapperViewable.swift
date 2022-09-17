//
//  WrapperViewable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol WrapperViewable: UIView {

    associatedtype WrappedView: UIView
    associatedtype OriginalView: UIView

    var wrappedView: WrappedView { get }
    var originalView: OriginalView { get }
}
