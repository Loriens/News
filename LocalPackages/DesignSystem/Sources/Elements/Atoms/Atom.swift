import UIKit

protocol Atom: AnyObject {
    var theme: Theme { get set }

    func updateAppearance()
    func observeThemeUpdate()
}

extension Atom {
    func observeThemeUpdate() {
        NotificationCenter.default.addObserver(forName: .themeDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.theme = ThemeManager.shared.theme
            self?.updateAppearance()
        }
    }
}
