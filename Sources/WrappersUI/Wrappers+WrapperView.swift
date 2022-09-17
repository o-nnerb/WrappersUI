//
//  Wrappers+WrapperView.swift
//
//
//  Created by onnerb on 15/09/22.
//

import Foundation
import UIKit

extension Wrappers {

    @MainActor
    open class WrapperView: UIView, WrapperViewable {

        public let originalView: OriginalView
        public let wrappedView: WrappedView

        public init(
            original: OriginalView,
            wrapped: WrappedView
        ) {
            self.originalView = original
            self.wrappedView = wrapped
            super.init(frame: .zero)
            setupView()
        }

        @available(*, unavailable)
        public override init(frame: CGRect) {
            fatalError("init(frame:) has not been implemented")
        }

        @available(*, unavailable)
        public required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupView() {
            guard let methods = self as? ViewCodable else {
                return
            }

            methods.buildHierarchy()
            methods.setupConstraints()
            methods.applyAdditionalChanges()
        }
    }
}
