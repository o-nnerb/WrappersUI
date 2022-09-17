//
//  PrimitiveViewControllerLoadable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol PrimitiveViewControllerLoadable {

    func loadView() -> UIView
}
