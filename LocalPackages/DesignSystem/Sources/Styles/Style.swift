protocol Style {
    associatedtype Element: Atom

    func perform(on element: Element)
}
