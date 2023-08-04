import UIKit

open class NavigationBar: UINavigationBar, Atom, Stylable {
    var theme: Theme
    var style: NavigationBarStyle?

    public override init(frame: CGRect = .zero) {
        theme = ThemeManager.shared.theme
        super.init(frame: frame)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func applyStyle(_ style: NavigationBarStyle) {
        self.style = style
        style.perform(on: self)
    }
}
