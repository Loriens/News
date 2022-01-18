import Foundation

public final class ThemeManager {
    public static var shared = ThemeManager(theme: ThemeMainLight())

    public var theme: Theme

    private init(theme: Theme) {
        self.theme = theme
    }

    public func update(theme: Theme) {
        self.theme = theme
        NotificationCenter.default.post(name: .themeDidChange, object: nil)
    }
}
