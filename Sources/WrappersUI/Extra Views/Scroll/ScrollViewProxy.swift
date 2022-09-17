//
//  ScrollViewProxy.swift
//
//
//  Created by onnerb on 17/09/22.
//

import Foundation

public class ScrollViewProxy {

    var layout: ((CGRect) -> Void)?

    init() {}

    public func onLayout(_ layout: @escaping (CGRect) -> Void) {
        let old = self.layout
        self.layout = {
            old?($0)
            layout($0)
        }
    }
}
