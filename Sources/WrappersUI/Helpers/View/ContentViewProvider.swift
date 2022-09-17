//
//  ContentViewProvider.swift
//
//
//  Created by onnerb on 15/09/22.
//

import UIKit

@MainActor
public protocol ContentViewProvider {

    associatedtype ContentView: UIView

    var contentView: ContentView { get }
}
