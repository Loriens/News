public struct ThemeMainDark: Theme {
    public let colors: Colors
    public let font: Font

    public init() {
        self.colors = ThemeMainDarkColors()
        font = MainThemeFont()
    }
}
