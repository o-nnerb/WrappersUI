//
//  ContentViewProvider+PrimitiveViewControllerLoadable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

extension ContentViewProvider where Self: UIViewController & PrimitiveViewControllerLoadable {

    public func loadView() -> UIView {
        contentView
    }
}
