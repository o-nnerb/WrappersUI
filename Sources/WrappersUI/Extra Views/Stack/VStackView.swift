//
//  VStackView.swift
//
//
//  Created by onnerb on 17/09/22.
//

import UIKit

@MainActor
open class VStackView: UIView {

    private let stackView = UIStackView()

    open var arrangedSubviews: [UIView] {
        stackView.arrangedSubviews
    }

    open var distribution: UIStackView.Distribution {
        get { stackView.distribution }
        set { stackView.distribution = newValue }
    }

    public init(
        alignment: HorizontalAlignment? = nil,
        spacing: CGFloat = .zero,
        _ content: [UIView]
    ) {
        super.init(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = spacing
        stackView.alignment = alignment?.base ?? .fill
        content.forEach {
            stackView.addArrangedSubview($0)
        }
        setupView()
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

    open func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }

    open func removeArrangedSubview(_ view: UIView) {
        stackView.removeArrangedSubview(view)
    }

    open func insertArrangedSubview(_ view: UIView, at index: Int) {
        stackView.insertArrangedSubview(view, at: index)
    }
}

extension VStackView: ViewCodable {

    func buildHierarchy() {
        append(stackView)
    }

    func setupConstraints() {
        stackView.anchor {
            $0.top.equal()
            $0.leading.equal()
            $0.trailing.equal()
            $0.bottom.equal()
        }
    }
}

extension VStackView {

    public convenience init(
        alignment: HorizontalAlignment? = nil,
        spacing: CGFloat = .zero,
        _ content: [UIView?]
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing,
            content.compactMap { $0 }
        )
    }

    public convenience init<Data: Collection>(
        alignment: HorizontalAlignment? = nil,
        spacing: CGFloat = .zero,
        _ items: Data,
        _ content: (Data.Element) -> UIView
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing,
            items.map {
                content($0)
            }
        )
    }
}
