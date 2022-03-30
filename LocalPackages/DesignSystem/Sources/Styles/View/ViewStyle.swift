public enum ViewStyle: Style {
    case basic
    case accent
    case clear

    public func perform(on view: View) {
        switch self {
        case .basic:
            view.backgroundColor = view.theme.colors.backgroundBasic
        case .accent:
            view.backgroundColor = view.theme.colors.backgroundAccent
        case .clear:
            view.backgroundColor = .clear
        }
    }
}
