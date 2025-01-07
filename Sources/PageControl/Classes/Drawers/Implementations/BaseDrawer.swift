//
// page-control
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

public class BaseDrawer: IDrawer {
    // MARK: Properties

    /// The size of the item, defined by its width and height.
    public var size: CGSize
    /// The index of the currently selected item, represented as a fractional value to support animations or transitions.
    public var currentItem: CGFloat
    /// The total number of items (pages) in the drawer.
    public var numberOfPages: Int

    /// The space between individual items in the drawer.
    let space: CGFloat
    /// The default color of the items, used for unselected items.
    let itemColor: UIColor
    /// The color of the currently selected item, often more prominent to indicate focus.
    let selectedItemColor: UIColor
    /// The corner radius of the items, used to give them rounded edges.
    let radius: CGFloat

    public var contentSize: CGSize {
        CGSize(
            width: CGFloat(numberOfPages - 1) * size.width + CGFloat(numberOfPages - 1) * space,
            height: size.height + 16.0
        )
    }

    // MARK: Initialization

    /// Initializes a new instance of `BaseDrawer` with customizable properties.
    /// - Parameters:
    ///   - currentItem: The initial index of the selected item. Defaults to `0.0`.
    ///   - numberOfPages: The total number of items (pages). Defaults to `5`.
    ///   - space: The space between individual items in the drawer. Defaults to `4.0`.
    ///   - width: The width of each item. Defaults to `16.0`.
    ///   - height: The height of each item. Defaults to `3.0`.
    ///   - itemColor: The default color for unselected items. Defaults to `UIColor.lightGray`.
    ///   - selectedItemColor: The color for the selected item. Defaults to a semi-transparent blue.
    ///   - radius: The corner radius of the items for rounded edges. Defaults to `2`.
    public init(
        currentItem: CGFloat = .zero,
        numberOfPages: Int = .zero,
        space: CGFloat = 4.0,
        width: CGFloat = 16.0,
        height: CGFloat = 3.0,
        itemColor: UIColor = .lightGray,
        selectedItemColor: UIColor = .blue.withAlphaComponent(0.8),
        radius: CGFloat = 2
    ) {
        size = CGSize(width: width, height: height)
        self.currentItem = currentItem
        self.numberOfPages = numberOfPages
        self.space = space
        self.itemColor = itemColor
        self.selectedItemColor = selectedItemColor
        self.radius = radius
    }

    // MARK: IDrawer

    public func draw(_: CGRect) {}

    // MARK: Internal

    /// Calculates the horizontal center position for an item in a layout.
    ///
    /// - Parameters:
    ///   - rect: The bounding rectangle of the container.
    ///   - position: The item's position index (e.g., 0 for the first item).
    ///   - size: The width of the item.
    ///   - space: The space between items.
    ///   - numberOfPages: The total number of items (pages) in the layout.
    ///
    /// - Returns: The `x` coordinate for the center of the item.
    func centerX(
        _ rect: CGRect,
        position: CGFloat,
        size: CGFloat,
        space: CGFloat,
        numberOfPages: Int
    ) -> CGFloat {
        let dotPosition = (position * (size + space))
        let midX = rect.size.width / 2.0
        let midXWithSpaces = ((CGFloat(numberOfPages) * (size + (space - 1))) / 2.0)

        return dotPosition - midXWithSpaces + midX
    }

    /// Calculates the vertical center position for an item in a layout.
    ///
    /// - Parameters:
    ///   - rect: The bounding rectangle of the container.
    ///   - size: The height of the item.
    ///
    /// - Returns: The `y` coordinate for the center of the item.
    func centerY(_ rect: CGRect, size: CGFloat) -> CGFloat {
        let midY = rect.size.height / 2.0
        let midDotY = size / 2.0
        let centerY = midY - midDotY

        return centerY
    }

    /// Draws a rounded rectangular item with optional border and fill color.
    ///
    /// - Parameters:
    ///   - rect: The rectangle defining the item's position and size.
    ///   - radius: The corner radius for the item's rounded edges.
    ///   - color: The fill color for the item.
    ///   - borderWidth: The width of the item's border. Defaults to `0`.
    ///   - borderColor: The color of the item's border. Defaults to `.clear`.
    func drawItem(
        _ rect: CGRect,
        radius: CGFloat,
        color: UIColor,
        borderWidth: CGFloat = .zero,
        borderColor: UIColor = .clear
    ) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        path.lineWidth = borderWidth
        borderColor.setStroke()
        path.stroke()
        color.setFill()
        path.fill()
    }
}
