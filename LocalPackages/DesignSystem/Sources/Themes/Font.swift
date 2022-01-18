import UIKit

public protocol Font {
    func dynamicallyScalingFont(weight: UIFont.Weight, size: CGFloat) -> UIFont?
}
