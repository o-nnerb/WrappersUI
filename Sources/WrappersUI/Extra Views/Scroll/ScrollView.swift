//
//  ScrollView.swift
//
//
//  Created by onnerb on 17/09/22.
//

import UIKit

@MainActor
open class ScrollView<Content: UIView>: UIScrollView {

    public let content: Content

    private let proxy: ScrollViewProxy
    private let axes: Axis.Set
    private let showsIndicators: Bool

    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        content: (ScrollViewProxy) -> Content
    ) {
        let proxy = ScrollViewProxy()
        self.proxy = proxy
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.content = content(proxy)
        super.init(frame: .zero)
        setupView()
    }

    public convenience init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        content: () -> Content
    ) {
        self.init(
            axes,
            showsIndicators: showsIndicators,
            content: { _ in content() }
        )
    }

    @available(*, unavailable)
    public init() {
        fatalError("init) has not been implemented")
    }

    @available(*, unavailable)
    override public init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        proxy.layout?(.init(
            x: contentOffset.x,
            y: contentOffset.y,
            width: contentSize.width,
            height: contentSize.height
        ))
    }
}

extension ScrollView: ViewCodable {

    func buildHierarchy() {
        append(content)
    }

    func setupConstraints() {
        content.anchor(contentLayoutGuide) {
            $0.top.equal()
            $0.bottom.equal()
            $0.leading.equal()
            $0.trailing.equal()
        }

        content.anchor(frameLayoutGuide) {
            if !axes.contains(.vertical) {
                $0.height.equal()
            }

            if !axes.contains(.horizontal) {
                $0.width.equal()
            }
        }
    }

    func applyAdditionalChanges() {
        showsVerticalScrollIndicator = axes.contains(.vertical) && showsIndicators
        showsHorizontalScrollIndicator = axes.contains(.horizontal) && showsIndicators

        alwaysBounceVertical = axes.contains(.vertical)
        alwaysBounceHorizontal = axes.contains(.horizontal)

        isDirectionalLockEnabled = [(.vertical, .horizontal), (.horizontal, .vertical)].contains {
            axes.contains($0) && !axes.contains($1)
        }
    }
}
