//
// page-control
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

/// A protocol that defines the behavior for drawing a custom UI component, such as a pager or a carousel.
public protocol IDrawer {
    /// The index or position of the current item being displayed.
    /// This property determines which item is currently in focus.
    var currentItem: CGFloat { get set }

    /// The size of each item in the drawer.
    /// This could represent the width or height, depending on the layout.
    var size: CGSize { get set }

    /// The total number of pages or items in the drawer.
    /// Used to calculate the range of drawable items or manage pagination logic.
    var numberOfPages: Int { get set }

    /// The content size of the element.
    var contentSize: CGSize { get }

    /// A method responsible for drawing the content within the specified rectangle.
    ///
    /// - Parameter rect: The area in which the content should be drawn.
    /// This is typically provided by the rendering system (e.g., a `UIView` or `CALayer`).
    func draw(_ rect: CGRect)
}
