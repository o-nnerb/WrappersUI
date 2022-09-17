//
//  Text.swift
//  
//
//  Created by onnerb on 17/09/22.
//

import UIKit

public struct Text<Attributes: TextAttributes> {

    private let attributed: NSAttributedString
    private let style: NSMutableParagraphStyle
    private let lineLimit: Int?

    fileprivate init(
        attributed: NSAttributedString,
        style: NSMutableParagraphStyle,
        lineLimit: Int?
    ) {
        self.attributed = attributed
        self.style = style
        self.lineLimit = lineLimit
    }

    public init(_ string: String) where Attributes == LayoutAttributes {
        self.init(
            attributed: .init(string: string),
            style: .init(),
            lineLimit: nil
        )
    }

    public init(_ attributedString: NSAttributedString) where Attributes == LayoutAttributes {
        self.init(
            attributed: attributedString,
            style: .init(),
            lineLimit: nil
        )
    }
}

extension Text {

    func set<Attributes: TextAttributes>(
        _ attribute: NSAttributedString.Key,
        to value: Any
    ) -> Text<Attributes> {
        let attributed = NSMutableAttributedString(attributedString: attributed)

        attributed.addAttributes(
            [attribute: value],
            range: (attributed.string as NSString).range(of: attributed.string)
        )

        return .init(
            attributed: attributed,
            style: style,
            lineLimit: lineLimit
        )
    }

    func paragraph<Value>(
        _ keyPath: WritableKeyPath<NSMutableParagraphStyle, Value>,
        to value: Value
    ) -> Text<LabelAttributes> {
        var style = style
        style[keyPath: keyPath] = value

        return .init(
            attributed: attributed,
            style: style,
            lineLimit: lineLimit
        )
    }
}

extension Text where Attributes == LayoutAttributes {

    public static func + (
        _ lhs: Text<Attributes>,
        _ rhs: Text<Attributes>
    ) -> Text<Attributes> {
        let attributed = NSMutableAttributedString(attributedString: lhs.attributed)
        attributed.append(rhs.attributed)

        return .init(
            attributed: attributed,
            style: .init(),
            lineLimit: nil
        )
    }
}

extension Text {

    public func font(_ font: UIFont) -> Self {
        set(.font, to: font)
    }

    public func foregroundColor(_ color: UIColor) -> Self {
        set(.foregroundColor, to: color)
    }
}

extension Text {

    public func lineLimit(_ lineLimit: Int?) -> Text<LabelAttributes> {
        .init(
            attributed: attributed,
            style: style,
            lineLimit: lineLimit
        )
    }
}

extension Text {

    public func lineSpacing(_ lineSpacing: CGFloat) -> Text<LabelAttributes> {
        paragraph(\.lineSpacing, to: lineSpacing)
    }

    func multilineTextAlignment(_ alignment: NSTextAlignment) -> Text<LabelAttributes> {
        paragraph(\.alignment, to: alignment)
    }
}

extension Text {

    public func render() -> UILabel {
        let label = UILabel()
        assign(to: label)
        return label
    }

    public func assign(to label: UILabel) {
        let text: Text<Attributes> = set(.paragraphStyle, to: style)
        label.attributedText = text.attributed
        label.numberOfLines = text.lineLimit ?? .zero
    }
}
