<h1 align="center" style="margin-top: 0px;">page-control</h1>

<p align="center">
<a href="https://github.com/space-code/page-control/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/space-code/page-control?style=flat"></a> 
<a href="https://swiftpackageindex.com/space-code/page-control"><img alt="Swift Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Fpage-control%2Fbadge%3Ftype%3Dswift-versions"/></a> 
<a href="https://swiftpackageindex.com/space-code/page-control"><img alt="Platform Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Fpage-control%2Fbadge%3Ftype%3Dplatforms"/></a> 
<a href="https://github.com/space-code/page-control"><img alt="CI" src="https://github.com/space-code/page-control/actions/workflows/ci.yml/badge.svg?branch=main"></a>
</p>

## Description
`page-control` is a highly customizable page control.

- [Usage](#usage)
- [Requirements](#requirements)
- [Installation](#installation)
- [Communication](#communication)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Usage

```swift
import PageControl

let pageControl = PageControl()

pageControl.numberOfPages = 5
pageControl.drawer = ExtendedLineDrawer(
    itemColor: .lightGray,
    selectedItemColor: .blue
)
```

The custom drawer can be implemented, such as:

```swift
import PageControl

final class MyCustomDrawer: BaseDrawer {
    override public func draw(_ rect: CGRect) {
        // Custom implementation for drawing content in the provided rectangle.
    }

    override public var contentSize: CGSize {
        // Custom implementation for calculating the content size.
    }
}
```

## Requirements

- iOS 14.0+
- Xcode 16.0
- Swift 6.0

## Installation
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but `page-control` does support its use on supported platforms.

Once you have your Swift package set up, adding `page-control` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/space-code/page-control.git", .upToNextMajor(from: "1.0.0"))
]
```

## Communication
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Contributing
Bootstrapping development environment

```
make bootstrap
```

Please feel free to help out with this project! If you see something that could be made better or want a new feature, open up an issue or send a Pull Request!

## Author
Nikita Vasilev, nv3212@gmail.com

## License
page-control is available under the MIT license. See the LICENSE file for more info.