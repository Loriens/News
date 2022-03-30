protocol Stylable {
    associatedtype CustomStyle: Style

    var style: CustomStyle? { get set }

    func applyStyle(_ style: CustomStyle)
}
