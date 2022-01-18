public enum LabelStyle: Style {
    case bigTitle
    case smallTitle
    case subtitle

    public func perform(on label: Label) {
        switch self {
        case .bigTitle:
            label.textAlignment = .center
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = label.theme.font.dynamicallyScalingFont(weight: .bold, size: 22)
            label.textColor = label.theme.colors.textPrimary
            label.adjustsFontForContentSizeCategory = true
        case .smallTitle:
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = label.theme.font.dynamicallyScalingFont(weight: .medium, size: 18)
            label.textColor = label.theme.colors.textPrimary
            label.adjustsFontForContentSizeCategory = true
        case .subtitle:
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = label.theme.font.dynamicallyScalingFont(weight: .medium, size: 18)
            label.textColor = label.theme.colors.textPrimary
            label.adjustsFontForContentSizeCategory = true
        }
    }
}
