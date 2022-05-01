public struct ThemeMainLight: Theme {
    public let id: String
    public let colors: Colors
    public let font: Font

    public init() {
        id = "ThemeMainLight"
        self.colors = ThemeMainLightColors()
        font = MainThemeFont()
    }
}
