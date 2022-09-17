//
//  VerticalAlignment.swift
//
//
//  Created by onnerb on 17/09/22.
//

import UIKit

public enum VerticalAlignment {
    case top
    case center
    case bottom
    case firstTextBaseline
    case lastTextBaseline
}

extension VerticalAlignment {

    var base: UIStackView.Alignment {
        switch self {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        case .firstTextBaseline:
            return .firstBaseline
        case .lastTextBaseline:
            return .lastBaseline
        }
    }
}
