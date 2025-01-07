//
// page-control
// Copyright © 2025 Space Code. All rights reserved.
//

import UIKit

// MARK: - PageControl

public final class PageControl: UIView {
    // MARK: Properties

    private var startTime: TimeInterval = .zero
    private var nextCurrentItem: CGFloat = .zero
    private var previousCurrentItem: CGFloat = .zero
    private var displayLink: CADisplayLink?

    public var drawer: IDrawer = ExtendedLineDrawer()

    public var numberOfPages: Int {
        get { drawer.numberOfPages }
        set {
            setNeedsDisplay()
            drawer.numberOfPages = newValue
        }
    }

    // MARK: Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: Override

    override public var intrinsicContentSize: CGSize {
        sizeThatFits(.zero)
    }

    override public func sizeThatFits(_: CGSize) -> CGSize {
        drawer.contentSize
    }

    override public func draw(_ rect: CGRect) {
        drawer.draw(rect)
    }

    // MARK: Public

    public func set(pageOffset: CGFloat) {
        drawer.currentItem = pageOffset
        setNeedsDisplay()
    }

    public func set(page index: Int) {
        if nextCurrentItem != CGFloat(index) {
            previousCurrentItem = round(drawer.currentItem)
            nextCurrentItem = CGFloat(index)
            runDisplayLink()
        }
    }

    // MARK: Private

    private func setupUI() {
        backgroundColor = .clear
    }

    private func runDisplayLink() {
        stopDisplayLink()

        startTime = Date.timeIntervalSinceReferenceDate

        displayLink = CADisplayLink(target: self, selector: #selector(displayLinkDidFire(_:)))
        displayLink?.add(to: .current, forMode: .common)
    }

    private func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }

    // MARK: Actions

    @objc
    private func displayLinkDidFire(_: CADisplayLink) {
        var elapsed = Date.timeIntervalSinceReferenceDate - startTime

        if elapsed > .animationDuration {
            stopDisplayLink()
            elapsed = .animationDuration
        }

        let progress = CGFloat(elapsed / .animationDuration)
        let sign = nextCurrentItem - previousCurrentItem

        drawer.currentItem = CGFloat(progress * sign + previousCurrentItem)

        setNeedsDisplay()
    }
}

// MARK: Constants

private extension Double {
    static let animationDuration = 0.2
}
