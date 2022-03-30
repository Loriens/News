import UIKit

open class Label: UILabel, Atom, Stylable {
    var theme: Theme
    var style: LabelStyle?

    public override init(frame: CGRect = .zero) {
        theme = ThemeManager.shared.theme
        super.init(frame: frame)
        observeThemeUpdate()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func updateAppearance() {
        style?.perform(on: self)
    }

    public func applyStyle(_ style: LabelStyle) {
        self.style = style
        style.perform(on: self)
    }
}
