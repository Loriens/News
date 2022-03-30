import UIKit

public protocol Colors {
    // MARK: - Text
    var textPrimary: UIColor? { get }
    var textSecondary: UIColor? { get }
    var textAccent: UIColor? { get }

    // MARK: - Background
    var backgroundBasic: UIColor? { get }
    var backgroundAccent: UIColor? { get }
}
