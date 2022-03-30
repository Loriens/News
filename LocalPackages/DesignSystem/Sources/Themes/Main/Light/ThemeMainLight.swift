public struct ThemeMainLight: Theme {
    public let colors: Colors
    public let font: Font

    public init() {
        self.colors = ThemeMainLightColors()
        font = MainThemeFont()
    }
}
