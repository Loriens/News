import Foundation

public final class ThemeManager {
    public static var shared = ThemeManager(theme: ThemeMain())

    public var theme: Theme

    private init(theme: Theme) {
        self.theme = theme
    }

    public func update(theme: Theme) {
        guard theme.id != self.theme.id else { return }
        self.theme = theme
    }
}
