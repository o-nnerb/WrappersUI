//
//  ViewCodable.swift
//
//
//  Created by onnerb on 15/09/22.
//

import Foundation

@MainActor
protocol ViewCodable {

    func buildHierarchy()

    func setupConstraints()

    func applyAdditionalChanges()
}

extension ViewCodable {

    func buildHierarchy() {}

    func setupConstraints() {}

    func applyAdditionalChanges() {}
}

extension ViewCodable {

    @MainActor
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}
