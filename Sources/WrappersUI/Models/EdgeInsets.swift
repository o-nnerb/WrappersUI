//
//  EdgeInsets.swift
//  
//
//  Created by onnerb on 17/09/22.
//

import Foundation

public struct EdgeInsets {

    public let top: CGFloat
    public let leading: CGFloat
    public let bottom: CGFloat
    public let trailing: CGFloat

    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
}
