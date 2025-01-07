//
// page-control
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

extension UIColor {
    /// Adds two `UIColor` objects together.
    ///
    /// - Parameters:
    ///   - color1: The first `UIColor`.
    ///   - color2: The second `UIColor`.
    ///
    /// - Returns: A new `UIColor` representing the sum of the two colors.
    ///   The resulting color's components are clamped to a maximum of 1.0.
    ///   If either color cannot be decomposed into RGBA components, `.clear` is returned.
    static func + (color1: UIColor, color2: UIColor) -> UIColor {
        var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))

        guard color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1),
              color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        else {
            return .clear
        }

        return UIColor(
            red: min(r1 + r2, 1.0),
            green: min(g1 + g2, 1.0),
            blue: min(b1 + b2, 1.0),
            alpha: (a1 + a2) / 2
        )
    }

    /// Multiplies a `UIColor`'s RGB components by a scalar multiplier.
    ///
    /// - Parameters:
    ///   - color: The `UIColor` to modify.
    ///   - multiplier: The scalar multiplier applied to the RGB components. Values are clamped between 0 and 1.
    ///
    /// - Returns: A new `UIColor` with modified RGB components. The alpha remains unchanged.
    ///   If the color cannot be decomposed into RGBA components, `.clear` is returned.
    static func * (color: UIColor, multiplier: CGFloat) -> UIColor {
        var (r, g, b, a) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))

        guard color.getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return .clear
        }

        return UIColor(
            red: min(max(r * multiplier, 0), 1.0),
            green: min(max(g * multiplier, 0), 1.0),
            blue: min(max(b * multiplier, 0), 1.0),
            alpha: a
        )
    }
}
