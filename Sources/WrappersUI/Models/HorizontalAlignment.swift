//
//  HorizontalAlignment.swift
//
//
//  Created by onnerb on 17/09/22.
//

import UIKit

public enum HorizontalAlignment {
    case leading
    case center
    case trailing
}

extension HorizontalAlignment {

    var base: UIStackView.Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
