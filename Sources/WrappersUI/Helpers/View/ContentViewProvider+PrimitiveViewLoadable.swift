//
//  ContentViewProvider.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit
import AnchorKit

extension ContentViewProvider where Self: UIView & PrimitiveViewLoadable {

    public func loadView() {
        append(contentView)
        contentView.anchor.edges.equal()
    }
}
