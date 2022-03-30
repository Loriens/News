import UIKit

public enum NavigationBarStyle: Style {
    case basic

    public func perform(on navigationBar: NavigationBar) {
        switch self {
        case .basic:
            let theme = navigationBar.theme

            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = theme.colors.backgroundBasic
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance

            navigationBar.isTranslucent = false
            navigationBar.tintColor = theme.colors.textPrimary
            navigationBar.titleTextAttributes = [
                .font: theme.font.dynamicallyScalingFont(weight: .bold, size: 20) as Any,
                .foregroundColor: theme.colors.textPrimary as Any
            ]
            navigationBar.prefersLargeTitles = false
        }
    }
}
