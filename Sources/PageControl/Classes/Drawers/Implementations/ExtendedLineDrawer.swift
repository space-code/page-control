//
// page-control
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

// MARK: - ExtendedLineDrawer

public final class ExtendedLineDrawer: BaseDrawer {
    // MARK: Override

    override public func draw(_ rect: CGRect) {
        drawIndicators(rect)
        drawCurrentItem(rect)
    }

    override public var contentSize: CGSize {
        CGSize(
            width: selectedItemWidth + CGFloat(numberOfPages - 1) * size.width + CGFloat(numberOfPages - 1) * space,
            height: size.height + .extraSpace
        )
    }

    // MARK: Private

    // swiftlint:disable:next function_body_length
    private func drawIndicators(_ rect: CGRect) {
        let step = (space + size.width)

        for index in 0 ... numberOfPages {
            if index != Int(currentItem + 1), index != Int(currentItem) {
                var newX: CGFloat = .zero
                var newY: CGFloat = .zero
                var newHeight: CGFloat = .zero
                var newWidth: CGFloat = .zero

                let progress = currentItem - floor(currentItem)

                var itemColor = itemColor

                if index == Int(currentItem + 2) {
                    itemColor = (self.itemColor * Double(1 - progress)) + (selectedItemColor * Double(progress))

                    let centerY = centerY(rect, size: size.height)

                    let currentProgress = currentItem - floor(currentItem)
                    let currentPosition = floor(currentItem + 2) - currentProgress

                    let x = centerX(
                        rect,
                        position: currentPosition,
                        size: size.width,
                        space: space,
                        numberOfPages: numberOfPages + 1
                    )

                    let ratio = 1 - currentProgress
                    let scale = step - (ratio * step)

                    newX = rect.origin.x + x
                    newY = rect.origin.y + centerY
                    newWidth = size.width + scale
                    newHeight = size.height
                } else {
                    let centerY = centerY(rect, size: size.height)

                    let x = centerX(
                        rect,
                        position: CGFloat(index),
                        size: size.width,
                        space: space,
                        numberOfPages: numberOfPages + 1
                    )

                    newX = rect.origin.x + x
                    newY = rect.origin.y + centerY
                    newWidth = size.width
                    newHeight = size.height
                }

                drawItem(
                    CGRect(
                        x: newX,
                        y: newY,
                        width: newWidth,
                        height: newHeight
                    ),
                    radius: radius,
                    color: itemColor
                )
            }
        }
    }

    private func drawCurrentItem(_ rect: CGRect) {
        let progress = currentItem - floor(currentItem)
        let color = (itemColor * Double(progress)) + (selectedItemColor * Double(1 - progress))

        if currentItem >= 0 {
            let step = (space + size.width)
            let centerY = centerY(rect, size: size.height)
            let position = floor(currentItem)

            let centerX = centerX(
                rect,
                position: position,
                size: size.width,
                space: space,
                numberOfPages: numberOfPages + 1
            )

            let rect = CGRect(
                x: rect.origin.x + centerX,
                y: rect.origin.y + centerY,
                width: selectedItemWidth,
                height: size.height
            )

            drawItem(rect, radius: radius, color: color)
        }
    }

    private var selectedItemWidth: CGFloat {
        let step = (space + size.width)
        let currentProgress = currentItem - floor(currentItem)
        let ratio = 1 - currentProgress
        let desiredWidth = size.width + ratio * step

        return desiredWidth
    }
}

// MARK: Constants

private extension CGFloat {
    static let extraSpace: CGFloat = 16.0
}
