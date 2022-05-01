public struct ThemeMainDark: Theme {
    public let id: String
    public let colors: Colors
    public let font: Font

    public init() {
        id = "ThemeMainDark"
        self.colors = ThemeMainDarkColors()
        font = MainThemeFont()
    }
}
