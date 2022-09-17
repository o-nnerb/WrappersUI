//
//  PrimitiveViewController.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
open class PrimitiveViewController: UIViewController {

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @available(*, unavailable)
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }

    @available(*, unavailable)
    public override func loadView() {
        if let loadable = self as? PrimitiveViewControllerLoadable {
            view = loadable.loadView()
            return
        }

        super.loadView()
    }
}
